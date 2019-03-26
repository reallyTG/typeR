library(joineR)


### Name: jointdata
### Title: Creates an object of class 'jointdata'
### Aliases: jointdata
### Keywords: data list survival

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve,
                              var.col = c("fuyrs", "status"), 
                              id.col = "num")
heart.valve.jd <- jointdata(survival = heart.surv, 
                            id.col = "num",
                            time.col = "time")



