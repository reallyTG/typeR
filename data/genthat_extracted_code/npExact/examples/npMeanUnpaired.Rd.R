library(npExact)


### Name: npMeanUnpaired
### Title: A test for comparing the means of two bounded random variables
###   given two independent samples
### Aliases: npMeanUnpaired
### Keywords: data mean test unpaired

### ** Examples


## test whether countries with french origin score lower than
## countries with no french origin
data(french)
npMeanUnpaired(french[[1]], french[[2]], alternative = "less", ignoreNA =
TRUE)

## test whether American tend to be more generous than Isrealis
## in a round of the Ultimatum game
data(bargaining)
npMeanUnpaired(bargaining$US, bargaining$IS, lower = 0, upper = 10, ignoreNA = TRUE)




