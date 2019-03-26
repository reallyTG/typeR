library(ACDm)


### Name: acdFit
### Title: ACD (Autoregressive Conditional Duration) Model Fitting
### Aliases: acdFit

### ** Examples


fitModel <- acdFit(durations = adjDurData, model = "ACD", 
            dist = "exponential", order = c(1,1), dailyRestart = 1)






