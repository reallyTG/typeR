library(joineR)


### Name: subset.jointdata
### Title: Subsetting object of class 'jointdata'
### Aliases: subset.jointdata
### Keywords: data

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve,
                              var.col = c("fuyrs", "status"),
                              id.col = "num")
heart.long <- heart.valve[, c(1, 4, 5, 7, 8, 9, 10, 11)]
heart.jd <- jointdata(longitudinal = heart.long, 
                      survival = heart.surv,
                      id.col = "num",
                      time.col = "time")
take <- heart.jd$survival$num[heart.jd$survival$status == 0]
heart.jd.cens <- subset(heart.jd, take)



