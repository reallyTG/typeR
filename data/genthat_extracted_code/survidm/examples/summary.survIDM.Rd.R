library(survidm)


### Name: summary.survIDM
### Title: Summarizing fits of 'survIDM' class
### Aliases: summary.survIDM print.survIDM

### ** Examples

fit <- tprob(survIDM(time1,event1,Stime, event) ~ 1, s = 365,
method = "AJ", conf = TRUE, conf.level = 0.95,
conf.type = "linear", n.boot = 100, data = colonIDM)

summary(fit)
summary(fit, times = c(400, 1000, 2900))

    


