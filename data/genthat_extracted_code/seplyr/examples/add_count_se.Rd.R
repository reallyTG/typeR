library(seplyr)


### Name: add_count_se
### Title: tally/count standard interface.
### Aliases: add_count_se

### ** Examples



datasets::iris %.>% count_se(., wt = "Sepal.Width", groupingVars= c('Species'))




