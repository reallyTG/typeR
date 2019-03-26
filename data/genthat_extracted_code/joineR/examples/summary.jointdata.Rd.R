library(joineR)


### Name: summary.jointdata
### Title: Summarise a 'jointdata' object
### Aliases: summary.jointdata
### Keywords: methods

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve,
                              var.col = c("fuyrs", "status"), 
                              id.col = "num")
heart.valve.jd <- jointdata(survival = heart.surv, 
                            id.col = "num",
                            time.col = "time")
summary(heart.valve.jd)



