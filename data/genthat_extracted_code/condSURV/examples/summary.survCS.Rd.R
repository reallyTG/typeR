library(condSURV)


### Name: summary.survCS
### Title: Summarizing fits of 'survCS' class
### Aliases: summary.survCS print.survCS

### ** Examples

    fit <- survCOND(survCS(time1, event1, Stime, event) ~ 1, x = 365,
    data = colonCS, method = "LDM", conf = TRUE, n.boot = 50, cluster = FALSE)
   summary(fit)
    summary(fit, times = c(400, 1000, 2900))

    


