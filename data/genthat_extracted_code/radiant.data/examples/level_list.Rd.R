library(radiant.data)


### Name: level_list
### Title: Generate list of levels and unique values
### Aliases: level_list

### ** Examples

data.frame(a = c(rep("a",5),rep("b",5)), b = c(rep(1,5),6:10)) %>% level_list
level_list(mtcars, mpg, cyl)




