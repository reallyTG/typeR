library(seplyr)


### Name: tally_se
### Title: tally/count standard interface.
### Aliases: tally_se

### ** Examples



datasets::mtcars %.>% tally_se(.)


datasets::mtcars %.>% tally_se(., wt = "cyl")




