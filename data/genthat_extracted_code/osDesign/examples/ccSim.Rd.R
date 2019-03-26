library(osDesign)


### Name: ccSim
### Title: Simulation function for case-control study designs.
### Aliases: ccSim

### ** Examples

##
data(Ohio)

## 
XM   <- cbind(Int=1, Ohio[,1:3])
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)
betaNamesM <- c("Int", "Age1", "Age2", "Sex", "Race")

## Single case-control design
##
## Not run: 
##D ccResults1 <- ccSim(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N,
##D                     nCC=500, r=1, betaNames=betaNamesM, monitor=100)
##D ccResults1
## End(Not run)

## Examining unbalanced case-control designs
##
## Not run: 
##D ccResults2 <- ccSim(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N,
##D                     nCC=500, r=c(0.25, 0.33, 0.5, 1, 2, 3, 4),
##D                     betaNames=betaNamesM, monitor=100)
##D ccResults2
## End(Not run)



