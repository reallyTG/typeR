library(eqs2lavaan)


### Name: plotCov
### Title: Plot a Covariance/Correlation Heat Map
### Aliases: plotCov
### Keywords: cov cor corr EQS lavaan eqsCov eqsCorr matrix image heat heat
###   map plot

### ** Examples

library(datasets)
## No test: 
plotCov(ability.cov$cov)
## End(No test)
## No test: 
plotCov(cov(attitude))
## End(No test)

library(lavaan)
HolzingerSwineford1939
# Select variables x1-x9 only
HS39 <- cov(HolzingerSwineford1939[,7:15])
## No test: 
plotCov(HS39)
## End(No test)



