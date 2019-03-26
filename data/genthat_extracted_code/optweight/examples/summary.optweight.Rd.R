library(optweight)


### Name: summary.optweight
### Title: Summarize, print, and plot information about estimated weights
### Aliases: summary.optweight summary.optweightMSM summary.optweight.svy
###   print.summary.optweight print.summary.optweightMSM
###   print.summary.optweight.svy plot.summary.optweight

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#Balancing covariates between treatment groups (binary)
(ow1 <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = .001,
                estimand = "ATT"))

(s <- summary(ow1))

plot(s, breaks = 12)



