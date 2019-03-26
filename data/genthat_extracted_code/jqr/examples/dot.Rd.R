library(jqr)


### Name: dot
### Title: dot and related functions
### Aliases: dot dot_ dotstr dotstr_

### ** Examples

str <- '[{"name":"JSON", "good":true}, {"name":"XML", "good":false}]'
str %>% dot
str %>% index %>% dotstr(name)
'{"foo": 5, "bar": 8}' %>% dot
'{"foo": 5, "bar": 8}' %>% dotstr(foo)
'{"foo": {"bar": 8}}' %>% dotstr(foo.bar)



