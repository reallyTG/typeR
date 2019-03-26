library(ChainLadder)


### Name: MackChainLadder
### Title: Mack Chain-Ladder Model
### Aliases: MackChainLadder
### Keywords: models

### ** Examples

## See the Taylor/Ashe example in Mack's 1993 paper
GenIns
plot(GenIns)
plot(GenIns, lattice=TRUE)
GNI <- MackChainLadder(GenIns, est.sigma="Mack")
GNI$f
GNI$sigma^2
GNI # compare to table 2 and 3 in Mack's 1993 paper
plot(GNI)
plot(GNI, lattice=TRUE)

## Different weights
## Using alpha=0 will use straight average age-to-age factors 
MackChainLadder(GenIns, alpha=0)$f
# You get the same result via:
apply(GenIns[,-1]/GenIns[,-10],2, mean, na.rm=TRUE)

## Only use the last 5 diagonals, i.e. the last 5 calendar years
calPeriods <- (row(GenIns) + col(GenIns) - 1)
(weights <- ifelse(calPeriods <= 5, 0, ifelse(calPeriods > 10, NA, 1)))
MackChainLadder(GenIns, weights=weights, est.sigma = "Mack")

## Tail
## See the example in Mack's 1999 paper
Mortgage
m <- MackChainLadder(Mortgage)
round(summary(m)$Totals["CV(IBNR)",], 2) ## 26% in Table 6 of paper
plot(Mortgage)
# Specifying the tail and its associated uncertainty parameters
MRT <- MackChainLadder(Mortgage, tail=1.05, tail.sigma=71, tail.se=0.02, est.sigma="Mack")
MRT
plot(MRT, lattice=TRUE)
# Specify just the tail and the uncertainty parameters will be estimated
MRT <- MackChainLadder(Mortgage, tail=1.05)
MRT$f.se[9] # close to the 0.02 specified above
MRT$sigma[9] # less than the 71 specified above
# Note that the overall CV dropped slightly
round(summary(MRT)$Totals["CV(IBNR)",], 2) ## 24%
# tail parameter uncertainty equal to expected value 
MRT <- MackChainLadder(Mortgage, tail=1.05, tail.se = .05)
round(summary(MRT)$Totals["CV(IBNR)",], 2) ## 27%

## Parameter-risk (only) estimate of the total reserve = 3142387
tail(MRT$Total.ParameterRisk, 1) # located in last (ultimate) element
#  Parameter-risk (only) CV is about 19%
tail(MRT$Total.ParameterRisk, 1) / summary(MRT)$Totals["IBNR", ]

## Three terms in the parameter risk estimate
## First, the default (Mack) without the tail
m <- MackChainLadder(RAA, mse.method = "Mack")
summary(m)$Totals["Mack S.E.",]
## Then, with the third term
m <- MackChainLadder(RAA, mse.method = "Independence")
summary(m)$Totals["Mack S.E.",] ## Not significantly greater

## One year claims development results
M <- MackChainLadder(MW2014, est.sigma="Mack")
CDR(M)

## For more examples see:
## Not run: 
##D  demo(MackChainLadder)
## End(Not run)




