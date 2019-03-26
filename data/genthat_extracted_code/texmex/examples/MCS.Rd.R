library(texmex)


### Name: MCS
### Title: Multivariate conditional Spearman's rho
### Aliases: MCS plot.MCS ggplot.MCS print.MCS bootMCS plot.bootMCS
###   print.bootMCS summary.bootMCS ggplot.bootMCS print.summary.bootMCS
### Keywords: multivariate

### ** Examples


D <- liver[liver$dose == "D",]
plot(D)
## No test: 
Dmcs <- bootMCS(D[, 5:6])
Dmcs
plot(Dmcs)
## End(No test)



