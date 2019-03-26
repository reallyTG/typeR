library(pixiedust)


### Name: sprinkle
### Title: Define Customizations to a Table
### Aliases: sprinkle sprinkle.default sprinkle.dust_list
###   sprinkle_print_method sprinkle_print_method.default
###   sprinkle_print_method.dust_list sprinkle_table sprinkle_table.default
###   sprinkle_table.dust_list

### ** Examples

x <- dust(lm(mpg ~ qsec + factor(am), data = mtcars))
x %>% sprinkle(cols = 2:4, round = 3) %>% 
  sprinkle(cols = 5, fn = quote(pvalString(value))) %>% 
  sprinkle(rows = 2, bold = TRUE)




