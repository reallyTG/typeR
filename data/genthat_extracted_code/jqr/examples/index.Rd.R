library(jqr)


### Name: index
### Title: index and related functions
### Aliases: index index_ indexif indexif_ dotindex dotindex_

### ** Examples

str <- '[{"name":"JSON", "good":true}, {"name":"XML", "good":false}]'
str %>% index
'{"name":"JSON", "good":true}' %>% indexif(name)
'{"name":"JSON", "good":true}' %>% indexif(good)
'{"name":"JSON", "good":true}' %>% indexif(that)
'{"a": 1, "b": 1}' %>% index
'[]' %>% index
'[{"name":"JSON", "good":true}, {"name":"XML", "good":false}]' %>% index(0)
'["a","b","c","d","e"]' %>% index(2)
'["a","b","c","d","e"]' %>% index('2:4')
'["a","b","c","d","e"]' %>% index('2:5')
'["a","b","c","d","e"]' %>% index(':3')
'["a","b","c","d","e"]' %>% index('-2:')

str %>% index %>% select(bad = .name)

'[{"name":"JSON", "good":true}, {"name":"XML", "good":false}]' %>%
  dotindex(name)
'[{"name":"JSON", "good":true}, {"name":"XML", "good":false}]' %>%
  dotindex(good)
'[{"name":"JSON", "good":{"foo":5}}, {"name":"XML", "good":{"foo":6}}]' %>%
  dotindex(good)
'[{"name":"JSON", "good":{"foo":5}}, {"name":"XML", "good":{"foo":6}}]' %>%
  dotindex(good.foo)



