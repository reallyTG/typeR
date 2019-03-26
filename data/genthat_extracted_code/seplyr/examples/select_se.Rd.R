library(seplyr)


### Name: select_se
### Title: Select columns standard interface.
### Aliases: select_se

### ** Examples



datasets::mtcars %.>%
   select_se(., c("cyl", "gear")) %.>%
   head(.)
# essentially dplyr::select_at()

data.frame(a=1, b=2) %.>% select_se(., '-b')




