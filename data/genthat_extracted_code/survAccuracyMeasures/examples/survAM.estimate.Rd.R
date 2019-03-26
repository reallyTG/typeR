library(survAccuracyMeasures)


### Name: survAM.estimate
### Title: Nonparametric and Semiparametric estimates of accuracy measures
###   for a risk prediction marker from survival data
### Aliases: survAM.estimate

### ** Examples

data(SimData)

#non-parametric estimates
tmp <- survAM.estimate(time =survTime, 
                       event = status, 
                       marker = Y,
                       data = SimData,
                       estimation.method = "IPW",
                       predict.time = 2, 
                       marker.cutpoint = 0, 
                       bootstraps = 50)
tmp
tmp$estimates

#semi-parametric estimates
tmp <- survAM.estimate(time =survTime, 
                       event = status, 
                       marker = Y,
                       data = SimData,
                       estimation.method = "Cox",
                       predict.time = 2, 
                       marker.cutpoint = 0, 
                       bootstraps = 50)
                       
#semi-parametric estimates with asymptotic standard errors
tmp <- survAM.estimate(time =survTime, 
                       event = status, 
                       marker = Y,
                       data = SimData,
                       estimation.method = "Cox", 
                       se.method = "asymptotic", 
                       predict.time = 2, 
                       marker.cutpoint = 0, 
                       bootstraps = 50)




