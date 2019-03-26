library(CPsurv)


### Name: summarize.cpsurv
### Title: Summarize and print cpsurv objects
### Aliases: summarize.cpsurv print.cpsurv summary.cpsurv
###   print.summary.cpsurv

### ** Examples

data(survdata)
cpest <- cpsurv(survdata$time, survdata$event, cpmax = 360)
summary(cpest)



