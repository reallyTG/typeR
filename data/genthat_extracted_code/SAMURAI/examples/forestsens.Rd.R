library(SAMURAI)


### Name: forestsens
### Title: Forest Plot for Sensitivity Analysis
### Aliases: forestsens
### Keywords: forest plot meta-analysis sensitivity analysis

### ** Examples

library(SAMURAI)

data(Hpylori)
forestsens(Hpylori, binary=TRUE, higher.is.better=FALSE)
forestsens(Hpylori, binary=TRUE, higher.is.better=FALSE, plot.title="Test")
forestsens(Hpylori, binary=TRUE, higher.is.better=FALSE, random.number.seed=52)
forestsens(Hpylori, binary=TRUE, higher.is.better=FALSE, outlook="negative")
forestsens(Hpylori, binary=TRUE, higher.is.better=FALSE, all.outlooks=TRUE)

data(greentea)
forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE)
forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE,
  outlook="negative")
forestsens(greentea, binary=FALSE, mean.sd=TRUE, higher.is.better=FALSE,
  outlook="negative", smd.noise=0.3)



