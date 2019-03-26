library(jqr)


### Name: select
### Title: Select - filtering
### Aliases: select select_

### ** Examples

jq('[1,5,3,0,7]', 'map(select(. >= 2))')
'[1,5,3,0,7]' %>% map(select(. >= 2)) 


'{"foo": 4, "bar": 7}' %>% select(.foo == 4)
'{"foo": 5, "bar": 7} {"foo": 4, "bar": 7}' %>% select(.foo == 4)
'[{"foo": 5, "bar": 7}, {"foo": 4, "bar": 7}]' %>% index() %>% 
  select(.foo == 4)
'{"foo": 4, "bar": 7} {"foo": 5, "bar": 7} {"foo": 8, "bar": 7}' %>% 
  select(.foo < 6)

x <- '{"foo": 4, "bar": 2} {"foo": 5, "bar": 4} {"foo": 8, "bar": 12}'
jq(x, 'select((.foo < 6) and (.bar > 3))')
jq(x, 'select((.foo < 6) or (.bar > 3))')
x %>% select((.foo < 6) && (.bar > 3))
x %>% select((.foo < 6) || (.bar > 3))

x <- '[{"foo": 5, "bar": 7}, {"foo": 4, "bar": 7}, {"foo": 4, "bar": 9}]'
jq(x, '.[] | select(.foo == 4) | {user: .bar}')
x %>% index() %>% select(.foo == 4) %>% build_object(user = .bar)



