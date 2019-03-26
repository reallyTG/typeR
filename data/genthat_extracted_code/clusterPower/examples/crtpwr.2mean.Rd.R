library(clusterPower)


### Name: crtpwr.2mean
### Title: Power calculations for simple cluster randomized trials,
###   continuous outcome
### Aliases: crtpwr.2mean

### ** Examples

# Find the number of clusters per condition needed for a trial with alpha = .05, 
# power = 0.8, 10 observations per cluster, no variation in cluster size, a difference 
# of 1 unit,  icc = 0.1 and   a variance of five units.
crtpwr.2mean(n=10 ,d=1, icc=.1, varw=5)
# 
# The result, showimg m of greater than 15, suggests 16 clusters per condition should be used.



