library(santaR)


### Name: get_ind_time_matrix
### Title: Generate a Ind x Time DataFrame from input data
### Aliases: get_ind_time_matrix

### ** Examples

## 6 measurements, 3 subjects, 3 unique time-points
Yi   <- c(1,2,3,4,5,6)
ind  <- c('ind_1','ind_1','ind_1','ind_2','ind_2','ind_3')
time <- c(0,5,10,0,10,5)
get_ind_time_matrix(Yi, ind, time)
#        0  5 10
# ind_1  1  2  3
# ind_2  4 NA  5
# ind_3 NA  6 NA

## 56 measurements, 8 subjects, 7 unique time-points
Yi   <- acuteInflammation$data$var_1
ind  <- acuteInflammation$meta$ind
time <- acuteInflammation$meta$time
get_ind_time_matrix(Yi, ind, time)




