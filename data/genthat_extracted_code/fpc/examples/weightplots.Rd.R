library(fpc)


### Name: weightplots
### Title: Ordered posterior plots
### Aliases: weightplots
### Keywords: multivariate cluster

### ** Examples

  require(mclust)
  require(MASS)
  data(crabs)
  dc <- crabs[,4:8]
  cm <- mclustBIC(crabs[,4:8],G=9,modelNames="EEE")
  scm <- summary(cm,crabs[,4:8])
  weightplots(scm$z,clusternumbers=1:3,ask=FALSE)
  weightplots(scm$z,clusternumbers=1:3,allcol=1:9, ask=FALSE,
              legendposition=c(5,0.7))
# Remove ask=FALSE to have time to watch the plots.



