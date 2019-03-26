library(BNPTSclust)


### Name: tseriescm
### Title: Function for monthly time series clustering.
### Aliases: tseriescm

### ** Examples

## Do not run
#
# data(stocks)
# tseriescm.out <- tseriescm(stocks,maxiter=4000,level=FALSE,trend=TRUE,
#                            seasonality=TRUE,a=0,b=1)
#
# The console output of the above example is:
# 
# Number of groups of the chosen cluster configuration:  9 
# Time series in group 1 : 1 2 4 5 7 10 12 13 19 21 22 25 29 30 31 33 34 
# 40 41 42 43 44 46 47 48 49 52 57 58 
# Time series in group 2 : 3 6 8 9 11 14 15 17 18 26 27 28 32 35 36 37 38 
# 45 50 51 53 56 
# Time series in group 3 : 16 
# Time series in group 4 : 20 
# Time series in group 5 : 23 
# Time series in group 6 : 24 
# Time series in group 7 : 39 
# Time series in group 8 : 54 
# Time series in group 9 : 55 
# HM Measure:  199.2226 
#
# Make sure that chain convergence is always assessed. Run the following 
# code to show the cluster and diagnostic plots:

data(stocks)
data(tseriescm.out)
attach(tseriescm.out)

clusterplots(tseriescm.out,stocks)
diagplots(tseriescm.out)



