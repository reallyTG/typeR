library(RSurveillance)


### Name: sep.exact
### Title: Population sensitivity for census (all units tested)
### Aliases: sep.exact
### Keywords: methods

### ** Examples

# examples for sep.exact - checked
sep.exact(d=1, se = 0.92)
inf<- 1:5
sens<- 0.8
sep.exact(d=inf, se=sens)
sep.exact(se=0.8, d = ceiling(0.01*c(10, 50, 100, 250, 500)))



