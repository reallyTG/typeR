library(joineR)


### Name: jointplot
### Title: Joint plot of longitudinal and survival data
### Aliases: jointplot
### Keywords: dplot

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve, 
                              var.col = c("fuyrs", "status"),
                              id.col = "num")
heart.long <- heart.valve[, c("num", "time", "log.lvmi")]
heart.cov <- UniqueVariables(heart.valve, 
                             c("age", "sex"), 
                             id.col = "num")
heart.valve.jd <- jointdata(longitudinal = heart.long, 
                            baseline = heart.cov, 
                            survival = heart.surv,
                            id.col = "num",
                            time.col = "time")
jointplot(heart.valve.jd, Y.col = "log.lvmi", 
          Cens.col = "status", lag = 5)



