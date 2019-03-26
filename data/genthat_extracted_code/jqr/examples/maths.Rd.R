library(jqr)


### Name: maths
### Title: Math operations
### Aliases: maths do do_ lengthj sqrtj floorj minj minj_ maxj maxj_ ad map
###   map_

### ** Examples

# do math
jq('{"a": 7}', '.a + 1')
# adding null gives back same result
jq('{"a": 7}', '.a + null')
jq('{"a": 7}', '.a += 1')
'{"a": 7}' %>%  do(.a + 1)
# '{"a": 7}' %>%  do(.a += 1) # this doesn't work quite yet
'{"a": [1,2], "b": [3,4]}' %>%  do(.a + .b)
'{"a": [1,2], "b": [3,4]}' %>%  do(.a - .b)
'{"a": 3}' %>%  do(4 - .a)
'["xml", "yaml", "json"]' %>%  do('. - ["xml", "yaml"]')
'5' %>%  do(10 / . * 3)
## many JSON inputs
'{"a": [1,2], "b": [3,4]} {"a": [1,5], "b": [3,10]}' %>%  do(.a + .b)

# comparisons
'[5,4,2,7]' %>% index() %>% do(. < 4)
'[5,4,2,7]' %>% index() %>% do(. > 4)
'[5,4,2,7]' %>% index() %>% do(. <= 4)
'[5,4,2,7]' %>% index() %>% do(. >= 4)
'[5,4,2,7]' %>% index() %>% do(. == 4)
'[5,4,2,7]' %>% index() %>% do(. != 4)
## many JSON inputs
'[5,4,2,7] [4,3,200,0.1]' %>% index() %>% do(. < 4)

# length
'[[1,2], "string", {"a":2}, null]' %>% index %>% lengthj

# sqrt
'9' %>% sqrtj
## many JSON inputs
'9 4 5' %>% sqrtj

# floor
'3.14159' %>% floorj
## many JSON inputs
'3.14159 30.14 45.9' %>% floorj

# find minimum
'[5,4,2,7]' %>% minj
'[{"foo":1, "bar":14}, {"foo":2, "bar":3}]' %>% minj
'[{"foo":1, "bar":14}, {"foo":2, "bar":3}]' %>% minj(foo)
'[{"foo":1, "bar":14}, {"foo":2, "bar":3}]' %>% minj(bar)
## many JSON inputs
'[{"foo":1}, {"foo":14}] [{"foo":2}, {"foo":3}]' %>% minj(foo)

# find maximum
'[5,4,2,7]' %>% maxj
'[{"foo":1, "bar":14}, {"foo":2, "bar":3}]' %>% maxj
'[{"foo":1, "bar":14}, {"foo":2, "bar":3}]' %>% maxj(foo)
'[{"foo":1, "bar":14}, {"foo":2, "bar":3}]' %>% maxj(bar)
## many JSON inputs
'[{"foo":1}, {"foo":14}] [{"foo":2}, {"foo":3}]' %>% maxj(foo)

# increment values
## requires special % operators, they get escaped internally
'{"foo": 1}' %>% do(.foo %+=% 1)
'{"foo": 1}' %>% do(.foo %-=% 1)
'{"foo": 1}' %>% do(.foo %*=% 4)
'{"foo": 1}' %>% do(.foo %/=% 10)
'{"foo": 1}' %>% do(.foo %//=% 10)
### fix me - %= doesn't work
# '{"foo": 1}' %>% do(.foo %%=% 10)
## many JSON inputs
'{"foo": 1} {"foo": 2} {"foo": 3}' %>% do(.foo %+=% 1)

# add
'["a","b","c"]' %>% ad
'[1, 2, 3]' %>% ad
'[]' %>% ad
## many JSON inputs
'["a","b","c"] ["d","e","f"]' %>% ad

# map
## as far as I know, this only works with numbers, thus it's
## in the maths section
'[1, 2, 3]' %>% map(.+1)
'[1, 2, 3]' %>% map(./1)
'[1, 2, 3]' %>% map(.*4)
# many JSON inputs
'[1, 2, 3] [100, 200, 300] [1000, 2000, 30000]' %>% map(.+1)



