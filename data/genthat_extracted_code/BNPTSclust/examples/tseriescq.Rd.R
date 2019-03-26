library(BNPTSclust)


### Name: tseriescq
### Title: Function for quarterly time series clustering.
### Aliases: tseriescq

### ** Examples

## Do not run
#
# data(houses)
# tseriescq.out <- tseriescq(houses,maxiter=4000,level=FALSE,trend=TRUE,
#                            seasonality=TRUE,priora=TRUE)
#
# The console output of the above example is:
# 
# Number of groups of the chosen cluster configuration : 9
# Time series in group 1 : 1
# Time series in group 2 : 2 3 4 5 6 7 9 10 11 12 13 15 16 17 18 19 20 21 # 25 26 27 29 30 31 33
# Time series in group 3 : 8 23
# Time series in group 4 : 14
# Time series in group 5 : 22
# Time series in group 6 : 24
# Time series in group 7 : 28
# Time series in group 8 : 32
# Time series in group 9 : 34 
# HM Measure : 126.9543
#
# Make sure that chain convergence is always assessed. Run the following 
# code to show the cluster and diagnostic plots:

data(houses)
data(tseriescq.out)
attach(tseriescq.out)

clusterplots(tseriescq.out,houses)
diagplots(tseriescq.out)



