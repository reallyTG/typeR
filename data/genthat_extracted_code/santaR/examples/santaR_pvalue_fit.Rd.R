library(santaR)


### Name: santaR_pvalue_fit
### Title: Evaluate difference in group trajectories based on the
###   comparison of model fit (F-test) between one and two groups
### Aliases: santaR_pvalue_fit

### ** Examples

## 56 measurements, 8 subjects, 7 unique time-points
## Default parameter values decreased to ensure an execution < 2 seconds
Yi          <- acuteInflammation$data$var_3
ind         <- acuteInflammation$meta$ind
time        <- acuteInflammation$meta$time
group       <- acuteInflammation$meta$group
grouping    <- get_grouping(ind, group)
inputMatrix <- get_ind_time_matrix(Yi, ind, time)
SANTAObj    <- santaR_fit(inputMatrix, df=5, grouping=grouping, verbose=TRUE)
SANTAObj    <- santaR_pvalue_fit(SANTAObj, nPerm=100)




