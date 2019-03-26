library(icarus)


### Name: regroupCalibrationModalities
### Title: Regroup calibration modalities
### Aliases: regroupCalibrationModalities

### ** Examples

## Suppose we have a calibration matrix and a margin matrix containing information
## for two categorical variables "X1" (10 modalities) and "X2" (5 modalities)

matrixCal <- data.frame(matrix(
               c(floor(10*runif(100))+1,floor((5)*runif(100))+1,
               floor(10*runif(100))+1,rep(10,100)),
               ncol=4))
marginMatrix <- matrix(c("X1",10,rep(1/10,10),
                 "X2",5,rep(1/5,5),rep(0,5)), nrow=2, byrow=TRUE)

# table(matrixCal$X1)
# 1  2  3  4  5  6  7  8  9 10 
# 9  8  8  8 11 15 13  6 10 12 
# marginMatrix
# [,1] [,2] [,3]  [,4]  [,5]  [,6]  [,7]  [,8]  [,9]  [,10] [,11] [,12]
# [1,] "X1" "10" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1"
# [2,] "X2" "5"  "0.2" "0.2" "0.2" "0.2" "0.2" "0"   "0"   "0"   "0"   "0" 

regroupCalibrationModalities(matrixCal, marginMatrix, "X1", c(3,4,8), "0")

# table(matrixCal$X1)
# 0  1  2  5  6  7  9 10 
# 22  9  8 11 15 13 10 12 
# marginMatrix
# [,1] [,2] [,3]  [,4]  [,5]  [,6]  [,7]  [,8]  [,9]  [,10]
# [1,] "X1" "8"  "0.3" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1" "0.1"
# [2,] "X2" "5"  "0.2" "0.2" "0.2" "0.2" "0.2" "0"   "0"   "0"  




