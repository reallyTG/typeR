library(jqr)


### Name: peek
### Title: Peek at a query
### Aliases: peek

### ** Examples

'{"a": 7}' %>% do(.a + 1) %>% peek
'[8,3,null,6]' %>% sortj %>% peek



