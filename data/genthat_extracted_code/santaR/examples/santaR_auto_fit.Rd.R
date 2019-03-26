library(santaR)


### Name: santaR_auto_fit
### Title: Automate all steps of santaR fitting, Confidence bands
###   estimation and p-values calculation for one or multiple variables
### Aliases: santaR_auto_fit

### ** Examples

## 2 variables, 56 measurements, 8 subjects, 7 unique time-points
## Default parameter values decreased to ensure an execution < 2 seconds
inputData     <- acuteInflammation$data[,1:2]
ind           <- acuteInflammation$meta$ind
time          <- acuteInflammation$meta$time
group         <- acuteInflammation$meta$group
SANTAObjList  <- santaR_auto_fit(inputData, ind, time, group, df=5, ncores=0, CBand=TRUE,
                                pval.dist=TRUE, nBoot=100, nPerm=100)
# Input data generated: 0.02 secs
# Spline fitted: 0.03 secs
# ConfBands done: 0.53 secs
# p-val dist done: 0.79 secs
# total time: 1.37 secs
length(SANTAObjList)
# [1] 2
names(SANTAObjList)
# [1] "var_1" "var_2"




