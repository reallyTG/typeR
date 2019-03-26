library(jqr)


### Name: sortj
### Title: Sort and related
### Aliases: sortj sortj_ reverse

### ** Examples

# sort
'[8,3,null,6]' %>% sortj
'[{"foo":4, "bar":10}, {"foo":3, "bar":100}, {"foo":2, "bar":1}]' %>%
  sortj(foo)

# reverse order
'[1,2,3,4]' %>% reverse

# many JSON inputs
'[{"foo":7}, {"foo":4}] [{"foo":300}, {"foo":1}] [{"foo":2}, {"foo":1}]' %>%
  sortj(foo)

'[1,2,3,4] [10,20,30,40] [100,200,300,4000]' %>%
  reverse



