library(SHELF)


### Name: elicitConcProb
### Title: Elicit a concordance probability for two uncertain quantities,
###   and plot a joint sample
### Aliases: elicitConcProb

### ** Examples

## Not run: 
##D p1 <- c(0.25, 0.5, 0.75)
##D v1 <- c(0.5, 0.55, 0.6)
##D v2 <- c(0.22, 0.3, 0.35)
##D myfit1 <- fitdist(v1, p1, 0, 1)
##D myfit2 <- fitdist(v2, p1, 0, 1)
##D elicitConcProb(myfit1, myfit2, 0.55, 0.3, d=c("Beta", "Beta"))
## End(Not run)



