library(jqr)


### Name: keys
### Title: Operations on keys, or by keys
### Aliases: keys del del_ haskey haskey_

### ** Examples

# get keys
str <- '{"foo": 5, "bar": 7}'
jq(str, "keys")
str %>% keys()

# delete by key name
jq(str, "del(.bar)")
str %>% del(bar)

# check for key existence
str3 <- '[[0,1], ["a","b","c"]]'
jq(str3, "map(has(2))")
str3 %>% haskey(2)
jq(str3, "map(has(1,2))")
str3 %>% haskey(1,2)

## many JSON inputs
'{"foo": 5, "bar": 7} {"hello": 5, "world": 7}' %>% keys
'{"foo": 5, "bar": 7} {"hello": 5, "bar": 7}' %>% del(bar)



