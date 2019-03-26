library(santaR)


### Name: santaR_plot
### Title: Plot a SANTAObj
### Aliases: santaR_plot

### ** Examples

## 56 measurements, 8 subjects, 7 unique time-points
Yi          <- acuteInflammation$data$var_3
ind         <- acuteInflammation$meta$ind
time        <- acuteInflammation$meta$time
group       <- acuteInflammation$meta$group
grouping    <- get_grouping(ind, group)
inputMatrix <- get_ind_time_matrix(Yi, ind, time)
SANTAObj    <- santaR_fit(inputMatrix, df=5, grouping=grouping, verbose=TRUE)
SANTAObj    <- santaR_CBand(SANTAObj, nBoot=100)
p           <- santaR_plot(SANTAObj, title='Example')
print(p)




