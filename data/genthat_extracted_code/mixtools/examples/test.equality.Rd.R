library(mixtools)


### Name: test.equality
### Title: Performs Chi-Square Tests for Scale and Location Mixtures
### Aliases: test.equality
### Keywords: file

### ** Examples

## Should a location mixture be used for the Old Faithful data?

data(faithful)
attach(faithful)
set.seed(100)
test.equality(y = waiting, arbmean = FALSE, arbvar = TRUE)




