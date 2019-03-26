library(santaR)


### Name: santaR_fit
### Title: Generate a SANTAObj for a variable
### Aliases: santaR_fit

### ** Examples

## 56 measurements, 8 subjects, 7 unique time-points
Yi             <- acuteInflammation$data$var_1
ind            <- acuteInflammation$meta$ind
time           <- acuteInflammation$meta$time
group          <- acuteInflammation$meta$group
grouping       <- get_grouping(ind, group)
inputMatrix    <- get_ind_time_matrix(Yi, ind, time)
resultSANTAObj <- santaR_fit(inputMatrix, df=5, grouping=grouping, verbose=TRUE)




