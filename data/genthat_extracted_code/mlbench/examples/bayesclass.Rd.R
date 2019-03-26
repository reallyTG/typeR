library(mlbench)


### Name: bayesclass
### Title: Bayes classifier
### Aliases: bayesclass bayesclass.noerr bayesclass.mlbench.2dnormals
###   bayesclass.mlbench.circle bayesclass.mlbench.xor
###   bayesclass.mlbench.cassini bayesclass.mlbench.cuboids
###   bayesclass.mlbench.twonorm bayesclass.mlbench.threenorm
###   bayesclass.mlbench.ringnorm
### Keywords: classif

### ** Examples

# 6 overlapping classes
p <- mlbench.2dnormals(500,6)
plot(p)

plot(p$x, col=as.numeric(bayesclass(p)))



