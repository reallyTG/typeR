library(jqr)


### Name: manip
### Title: Manipulation operations
### Aliases: manip join join_ splitj splitj_ ltrimstr ltrimstr_ rtrimstr
###   rtrimstr_ startswith startswith_ endswith endswith_ index_loc
###   index_loc_ rindex_loc rindex_loc_ indices indices_ tojson fromjson
###   tostring tonumber contains contains_ uniquej uniquej_ group group_

### ** Examples

# join
str <- '["a","b,c,d","e"]'
jq(str, 'join(", ")')
str %>% join
str %>% join(`;`)
str %>% join(`yep`)
## many JSON inputs
'["a","b,c,d","e"] ["a","f,e,f"]' %>% join(`---`)

# split
jq('"a, b,c,d, e"', 'split(", ")')

# ltrimstr
jq('["fo", "foo", "barfoo", "foobar", "afoo"]', '[.[]|ltrimstr("foo")]')
'["fo", "foo", "barfoo", "foobar", "afoo"]' %>% index() %>% ltrimstr(foo)

# rtrimstr
jq('["fo", "foo", "barfoo", "foobar", "foob"]', '[.[]|rtrimstr("foo")]')
'["fo", "foo", "barfoo", "foobar", "foob"]' %>% index() %>% rtrimstr(foo)

# startswith
str <- '["fo", "foo", "barfoo", "foobar", "barfoob"]'
jq(str, '[.[]|startswith("foo")]')
str %>% index %>% startswith(foo)
## many JSON inputs
'["fo", "foo"] ["barfoo", "foobar", "barfoob"]' %>% index %>% startswith(foo)

# endswith
jq(str, '[.[]|endswith("foo")]')
str %>% index %>% endswith(foo)
str %>% index %>% endswith_("foo")
str %>% index %>% endswith(bar)
str %>% index %>% endswith_("bar")
## many JSON inputs
'["fo", "foo"] ["barfoo", "foobar", "barfoob"]' %>% index %>% endswith(foo)

# get index (location) of a character
## input has to be quoted
str <- '"a,b, cd, efg, hijk"'
str %>% index_loc(", ")
str %>% index_loc(",")
str %>% index_loc("j")
str %>% rindex_loc(", ")
str %>% indices(", ")

# tojson, fromjson, tostring, tonumber
'[1, "foo", ["foo"]]' %>% index %>% tostring
'[1, "1"]' %>% index %>% tonumber
'[1, "foo", ["foo"]]' %>% index %>% tojson
'[1, "foo", ["foo"]]' %>% index %>% tojson %>% fromjson

# contains
'"foobar"' %>% contains("bar")
'["foobar", "foobaz", "blarp"]' %>% contains(`["baz", "bar"]`)
'["foobar", "foobaz", "blarp"]' %>% contains(`["bazzzzz", "bar"]`)
str <- '{"foo": 12, "bar":[1,2,{"barp":12, "blip":13}]}'
str %>% contains(`{foo: 12, bar: [{barp: 12}]}`)
str %>% contains(`{foo: 12, bar: [{barp: 15}]}`)

# unique
'[1,2,5,3,5,3,1,3]' %>% uniquej
str <- '[{"foo": 1, "bar": 2}, {"foo": 1, "bar": 3}, {"foo": 4, "bar": 5}]'
str %>% uniquej(foo)
str %>% uniquej_("foo")
'["chunky", "bacon", "kitten", "cicada", "asparagus"]' %>% uniquej(length)

# group
x <- '[{"foo":1, "bar":10}, {"foo":3, "bar":100}, {"foo":1, "bar":1}]'
x %>% group(foo)
x %>% group_("foo")



