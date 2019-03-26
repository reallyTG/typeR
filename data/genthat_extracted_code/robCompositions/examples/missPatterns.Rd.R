library(robCompositions)


### Name: missPatterns
### Title: missing or zero pattern structure.
### Aliases: missPatterns zeroPatterns zeroPatterns
### Keywords: multivariate

### ** Examples


data(expenditures)
## set NA's artificial:
expenditures[expenditures < 300] <- NA
## detect the NA structure:
missPatterns(expenditures)




