library(BNPTSclust)


### Name: tseriesca
### Title: Function for annual time series clustering.
### Aliases: tseriesca

### ** Examples

## Do not run
#
# data(gdp)
# tseriesca.out <- tseriesca(gdp,maxiter = 4000,level=FALSE,trend=TRUE,
#                            c0eps = 0.001,c1eps = 0.001,c0beta = 0.001,
#                            c1beta = 0.001,c0alpha = 0.001,
#                            c1alpha= 0.001,priorb = TRUE,a = 0,b = 0.1)
#
# The console output of the above example is:
# 
# Number of groups of the chosen cluster configuration : 13
# Time series in group 1 : 1 111
# Time series in group 2 : 2 8
# Time series in group 3 : 3 4 5 6 7 10 11 12 13 14 15 16 17 18 19 20 21
# 22 24 25 26 28 29 30 31 32 33 34 35 36 37 38 40 41 42 43 44 45 46 47 49
# 50 51 52 55 56 57 58 59 61 62 63 65 67 68 69 70 71 74 75 76 77 78 79 80
# 81 82 83 84 85 86 89 92 92 93 94 95 96 97 100 101 102 103 104 105 106
# 107 108 109 110 113 114 117 118 120
# Time series in group 4 : 9 23 48 54 60 87
# Time series in group 5 : 27
# Time series in group 6 : 39
# Time series in group 7 : 53 73 88
# Time series in group 8 : 64
# Time series in group 9 : 66 98 112
# Time series in group 10 : 72
# Time series in group 11 : 90 116 119 121
# Time series in group 12 : 99
# Time series in group 13 : 115 
# HM Measure : 99.50627
#
# Make sure that chain convergence is always assessed. Run the following 
# code to show the cluster and diagnostic plots:

data(gdp)
data(tseriesca.out)
attach(tseriesca.out)

clusterplots(tseriesca.out,gdp)
diagplots(tseriesca.out)




