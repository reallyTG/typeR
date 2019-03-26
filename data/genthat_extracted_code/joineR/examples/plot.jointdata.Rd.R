library(joineR)


### Name: plot.jointdata
### Title: Plot longitudinal data
### Aliases: plot.jointdata
### Keywords: dplot

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
plot(heart.jd, Y.col = "grad", col = "grey")



