library(santaR)


### Name: santaR_auto_summary
### Title: Summarise, report and save the results of a santaR analysis
### Aliases: santaR_auto_summary

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
result <- santaR_auto_summary(SANTAObjList)
print(result)
# $pval.all
#              dist dist_upper  dist_lower     curveCorr    dist_BH
# var_1 0.03960396 0.09783202 0.015439223 -0.2429725352 0.03960396
# var_2 0.00990099 0.05432519 0.001737742  0.0006572238 0.01980198
#
# $pval.summary
#       Test Inf 0.05 Inf 0.01 Inf 0.001
# 1    dist        2        1         0
# 2 dist_BH        2        0         0




