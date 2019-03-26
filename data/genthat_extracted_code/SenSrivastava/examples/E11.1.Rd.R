library(SenSrivastava)


### Name: E11.1
### Title: Artificially Created Data for an Example on Variable Search
### Aliases: E11.1
### Keywords: datasets

### ** Examples

data(E11.1)
exleaps <- require("leaps", quietly=TRUE)
if (exleaps) {
   E11.1.m1 <- regsubsets(y ~x.1+x.2+x.3+x.4, data=E11.1)
   summary(E11.1.m1)
   plot(E11.1.m1)
}



