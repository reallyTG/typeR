library(seplyr)


### Name: count_se
### Title: tally/count standard interface.
### Aliases: count_se

### ** Examples



datasets::mtcars %.>% count_se(., groupingVars= c('cyl', 'gear'))




