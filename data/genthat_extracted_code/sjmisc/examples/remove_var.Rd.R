library(sjmisc)


### Name: remove_var
### Title: Remove variables from a data frame
### Aliases: remove_var remove_cols

### ** Examples

mtcars %>% remove_var("disp", "cyl")
mtcars %>% remove_var(c("wt", "vs"))
mtcars %>% remove_var(drat:am)




