library(santaR)


### Name: get_eigen_spline
### Title: Compute eigenSplines across a dataset
### Aliases: get_eigen_spline

### ** Examples

## 7 measurements, 3 subjects, 4 unique time-points, 2 variables
inputData <- matrix(c(1,2,3,4,5,6,7,8,9 ,10,11,12,13,14,15,16,17,18), ncol=2)
ind  <- c('ind_1','ind_1','ind_1','ind_2','ind_2','ind_2','ind_3','ind_3','ind_3')
time <- c(0,5,10,0,10,15,5,10,15)
get_eigen_spline(inputData, ind, time, nPC=NA, scaling="scaling_UV", method="nipals",
                 verbose=TRUE, centering=TRUE, ncores=0)
# nipals calculated PCA
# Importance of component(s):
#                  PC1    PC2     PC3
# R2            0.7113 0.2190 0.05261
# Cumulative R2 0.7113 0.9303 0.98287
# total time: 0.12 secs
# $matrix
#              0          5        10         15
# PC1 -1.7075707 -0.7066426 0.7075708  1.7066425
# PC2 -0.3415271  0.9669724 1.0944005 -0.4297013
# PC3 -0.1764657 -0.5129981 0.5110671  0.1987611
# 
# $variance
# [1] 0.71126702 0.21899068 0.05260949
# 
# $model
# nipals calculated PCA
# Importance of component(s):
#                  PC1    PC2     PC3
# R2            0.7113 0.2190 0.05261
# Cumulative R2 0.7113 0.9303 0.98287
# 6 	Variables
# 4 	Samples
# 6 	NAs ( 25 %)
# 3 	Calculated component(s)
# Data was mean centered before running PCA 
# Data was NOT scaled before running PCA 
# Scores structure:
# [1] 4 3
# Loadings structure:
# [1] 6 3
# 
# $countTP
#   [,1]
# 3    6




