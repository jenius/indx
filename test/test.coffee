require('coffee-script/register')
should = require 'should'

describe 'basic', ->
  before -> @res = require './example'
  it 'should require js files', -> @res.foo.should.exist
  it 'should require coffee files', -> @res.bar.should.exist
  it 'should require files with js and coffe in filenames', -> @res.wowjs.should.exist
  it 'should require folders with a js index file', -> @res.f1.should.exist
  it 'should require folders with a coffee index file', -> @res.f2.should.exist
  it 'should not include non-js files', -> should.not.exist(@res.markdown)
  it 'should not include folders with no index', -> should.not.exist(@res.hello)

describe 'errors', ->
  it 'should error out on invalid js syntax', ->
    (-> require('./errors')).should.throw()
