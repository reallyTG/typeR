library(seplyr)


### Name: rename_se
### Title: rename standard interface.
### Aliases: rename_se

### ** Examples



datasets::mtcars %.>%
   rename_se(., c("cylinders" := "cyl", "gears" := "gear")) %.>%
   head(.)
# # same as:
# datasets::mtcars %>%
#    rename(cylinders = cyl, gears = gear) %>%
#    head()

# rename_se allows column swaps
data.frame(a = 1, b = 2) %.>%
   rename_se(., c('a', 'b') := c('b', 'a'))




