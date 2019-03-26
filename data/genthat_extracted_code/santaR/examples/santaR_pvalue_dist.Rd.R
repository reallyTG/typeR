library(santaR)


### Name: santaR_pvalue_dist
### Title: Evaluate difference in group trajectories based on the
###   comparison of distance between group mean curves
### Aliases: santaR_pvalue_dist

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
SANTAObj    <- santaR_pvalue_dist(SANTAObj, nPerm=100)




