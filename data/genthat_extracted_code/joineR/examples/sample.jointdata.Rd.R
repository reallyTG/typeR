library(joineR)


### Name: sample.jointdata
### Title: Sample from a 'jointdata' x
### Aliases: sample.jointdata
### Keywords: data

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve, 
                              var.col = c("fuyrs", "status"), 
                              id.col = "num")
heart.valve.jd <- jointdata(survival = heart.surv, 
                            id.col = "num", 
                            time.col = "time")
sample.jointdata(heart.valve.jd, size = 10)



