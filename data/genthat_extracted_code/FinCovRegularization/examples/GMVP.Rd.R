library(FinCovRegularization)


### Name: GMVP
### Title: Global Minimum Variance Portfolio
### Aliases: GMVP

### ** Examples

data(m.excess.c10sp9003)
assets <- m.excess.c10sp9003[,1:10]
GMVP(cov(assets), short=TRUE)
GMVP(cov(assets), short=FALSE)



