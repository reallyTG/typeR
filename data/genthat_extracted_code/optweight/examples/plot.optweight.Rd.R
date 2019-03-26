library(optweight)


### Name: plot.optweight
### Title: Plot Dual Variables for Assessing Balance Constraints
### Aliases: plot.optweight plot.optweight.svy

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#Balancing covariates between treatment groups (binary)
ow1 <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = c(.1, .1, .1, .1, .1),
                estimand = "ATT")

summary(ow1) # Note the coefficient of variation
             # and effective sample size (ESS)

plot(ow1) # age has a low value, married is high

ow2 <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = c(0, .1, .1, .1, .1),
                estimand = "ATT")

summary(ow2) # Notice that tightening the constraint
             # on age had a negligible effect on the
             # variability of the weights and ESS

ow3 <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = c(.1, .1, 0, .1, .1),
                estimand = "ATT")

summary(ow3) # In contrast, tightening the constraint
             # on married had a large effect on the
             # variability of the weights, shrinking
             # the ESS



