library(scoring)


### Name: calcscore
### Title: Calculate Scores Under A Specific Rule
### Aliases: calcscore calcscore.formula calcscore.default

### ** Examples

## Brier scores for two alternatives, with bounds of 0 and 1
data("WorldEvents")
scores <- calcscore(answer ~ forecast, fam="beta",
                    param=c(1,1), data=WorldEvents,
                    bounds=c(0,1))

## Calculate Brier scores manually
scores.man <- with(WorldEvents, (forecast - answer)^2)

## Comparison
all.equal(scores, scores.man)

## Average Brier score for each forecaster
with(WorldEvents, tapply(scores, forecaster, mean))

## Brier scores for 3 alternatives, with bounds of 0 and 1
data("WeatherProbs")
scores2 <- calcscore(tcat ~ tblw + tnrm + tabv, fam="pow",
                     param=2, data=WeatherProbs,
                     bounds=c(0,1))

## Spherical scores for 3 alternatives, reversed so 0 is worst and
## 1 is best
scores3 <- calcscore(tcat ~ tblw + tnrm + tabv, fam="sph",
                     param=2, data=WeatherProbs,
                     bounds=c(0,1), reverse=TRUE)

## Replicate Jose, Nau, & Winkler, 2009, Figure 1
r2 <- seq(0, .6, .05)
r <- cbind(.4, r2, .6 - r2)
j <- rep(1, length(r2))

## Panel 1
quad <- calcscore(j ~ r, fam="pow", param=2, bounds=c(-1,1), reverse=TRUE)
quadbase <- calcscore(j ~ r, fam="pow", param=c(2,.3,.6,.1), reverse=TRUE)
rankquad <- calcscore(j ~ r, fam="pow", param=2, ordered=TRUE, reverse=TRUE)
rankquadbase <- calcscore(j ~ r, fam="pow", param=c(2,.3,.6,.1), ordered=TRUE,
                          reverse=TRUE)
plot(r2, quad, ylim=c(-2,1), type="l", ylab="Quadratic scores")
lines(r2, quadbase, lty=2)
lines(r2, rankquad, type="o", pch=22)
lines(r2, rankquadbase, type="o", pch=2)

## Panel 2
sph <- calcscore(j ~ r, fam="sph", param=2, reverse=TRUE, bounds=c(-1.75,1))
sphbase <- calcscore(j ~ r, fam="sph", param=c(2,.3,.6,.1), reverse=TRUE)
ranksph <- calcscore(j ~ r, fam="sph", param=2, ordered=TRUE, reverse=TRUE)
ranksphbase <- calcscore(j ~ r, fam="sph", param=c(2,.3,.6,.1), ordered=TRUE,
                         reverse=TRUE)
plot(r2, sph, ylim=c(-1,.6), type="l", ylab="Spherical scores")
lines(r2, sphbase, lty=2)
lines(r2, ranksph, type="o", pch=22)
lines(r2, ranksphbase, type="o", pch=2)

## Panel 3
lg <- calcscore(j ~ r, fam="pow", param=1.001, reverse=TRUE)
lgbase <- calcscore(j ~ r, fam="pow", param=c(1.001,.3,.6,.1), reverse=TRUE)
ranklg <- calcscore(j ~ r, fam="pow", param=1.001, ordered=TRUE, reverse=TRUE)
ranklgbase <- calcscore(j ~ r, fam="pow", param=c(1.001,.3,.6,.1),
                        ordered=TRUE, reverse=TRUE)
plot(r2, lg, ylim=c(-2,1), type="l", ylab="Log scores")
lines(r2, lgbase, lty=2)
lines(r2, ranklg, type="o", pch=22)
lines(r2, ranklgbase, type="o", pch=2)



