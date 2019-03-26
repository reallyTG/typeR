library(DescTools)


### Name: ICC
### Title: Intraclass Correlations (ICC1, ICC2, ICC3 From Shrout and
###   Fleiss)
### Aliases: ICC print.ICC
### Keywords: multivariate

### ** Examples

sf <- matrix(c(
      9, 2, 5, 8,
      6, 1, 3, 2,
      8, 4, 6, 8,
      7, 1, 2, 6,
      10,5, 6, 9,
      6, 2, 4, 7),
      ncol=4, byrow=TRUE,
      dimnames=list(paste("S", 1:6, sep=""), paste("J", 1:4, sep=""))
)

sf  #example from Shrout and Fleiss (1979)
ICC(sf)



