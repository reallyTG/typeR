library(santaR)


### Name: get_eigen_spline_matrix
### Title: Generate a Ind x Time + Var data.frame concatenating all
###   variables from input variable
### Aliases: get_eigen_spline_matrix

### ** Examples

## Not run: 
##D ## 6 measurements, 3 subjects, 3 unique time-points, 2 variables
##D inputData <- matrix(c(1,2,3,4,5,6, 7,8,9,10,11,12), ncol=2)
##D ind  <- c('ind_1','ind_1','ind_1','ind_2','ind_2','ind_3')
##D time <- c(0,5,10,0,10,5)
##D get_eigen_spline_matrix(inputData, ind, time, ncores=0)
##D #     0   5  10
##D # 1   1   2   3
##D # 2   4  NA   5
##D # 3  NA   6  NA
##D # 4   7   8   9
##D # 5  10  NA  11
##D # 6  NA  12  NA
## End(Not run)



