library(santaR)


### Name: get_eigen_DF
### Title: Compute the optimal df and weighted-df using 5 spline fitting
###   metric
### Aliases: get_eigen_DF

### ** Examples

## 8 subjects, 8 time-points, 3 variables
inputData <- acuteInflammation$data[,1:3]
ind       <- acuteInflammation$meta$ind
time      <- acuteInflammation$meta$time
eigen     <- get_eigen_spline(inputData, ind, time, nPC=NA, scaling="scaling_UV",
                              method="nipals", verbose=TRUE, centering=TRUE, ncores=0)
# nipals calculated PCA
# Importance of component(s):
#                  PC1    PC2     PC3      PC4    PC5      PC6
# R2            0.8924 0.0848 0.01055 0.006084 0.0038 0.002362
# Cumulative R2 0.8924 0.9772 0.98775 0.993838 0.9976 1.000000
get_eigen_DF(eigen)
# $df
#       CV      GCV      AIC      BIC     AICc 
# 3.362581 4.255487 3.031260 2.919159 2.172547 
# $wdf
#       CV      GCV      AIC      BIC     AICc 
# 2.293130 2.085212 6.675608 6.671545 4.467724 




