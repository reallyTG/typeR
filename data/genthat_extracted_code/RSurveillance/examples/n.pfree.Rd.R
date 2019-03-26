library(RSurveillance)


### Name: n.pfree
### Title: Sample size to achieve desired (posterior) probability of
###   freedom
### Aliases: n.pfree
### Keywords: methods

### ** Examples

# examples for n.pfree
n.pfree(0.95, 0.5, 0.01, 0.05, 0.9)
n.pfree(0.95, 0.5, 0.01, 0.05, 0.9, N=300)
n.pfree(pfree = c(0.9, 0.95, 0.98, 0.99), prior = 0.7, 0.01, 0.01, 0.8, 1000)
n.pfree(0.95, 0.7, 0.01, 0.1, 0.96)



