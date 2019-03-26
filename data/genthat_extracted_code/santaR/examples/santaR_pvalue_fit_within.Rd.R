library(santaR)


### Name: santaR_pvalue_fit_within
### Title: Evaluate difference between a group mean curve and a constant
###   model using the comparison of model fit (F-test)
### Aliases: santaR_pvalue_fit_within

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
SANTAGroup  <- SANTAObj$groups[[1]]
#SANTAGroup <- SANTAObj$groups$Group1
santaR_pvalue_fit_within(SANTAGroup, nPerm=500)
# ~0.6726747




