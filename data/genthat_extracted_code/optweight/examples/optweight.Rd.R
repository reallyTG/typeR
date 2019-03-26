library(optweight)


### Name: optweight
### Title: Estimate Balancing Weights Using Optimization
### Aliases: optweight print.optweight print.optweightMSM

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#Balancing covariates between treatment groups (binary)
(ow1 <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = c(.01, .02, .03, .04, .05),
                estimand = "ATE"))
bal.tab(ow1)

#Exactly alancing covariates with respect to race (multinomial)
(ow2 <- optweight(race ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = 0, estimand = "ATT", focal = "black"))
bal.tab(ow2)

# #Balancing covariates with longitudinal treatments
# #NOT VALID; DO NOT DO THIS.
# library("twang")
# data("iptwExWide")
#
# ##Weighting more recent covariates more strictly
# (ow3 <- optweight(list(tx1 ~ use0 + gender + age,
#                        tx2 ~ tx1 + use1 + use0  + gender +
#                          age,
#                        tx3 ~ tx2 + use2 + tx1 + use1 +
#                          use0 + gender + age),
#                   data = iptwExWide,
#                   tols = list(c(.001, .001, .001),
#                               c(.001, .001, .01, .01, .01),
#                               c(.001, .001, .01, .01,
#                                 .1, .1, .1))))
# bal.tab(ow3)

#Balancing covariates between treatment groups (binary)
#and requesting a specified target population
(ow4a <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = 0,
                targets = c(26, 12, .4, .5, 1000),
                estimand = NULL))
bal.tab(ow4a, disp.means = TRUE)

#Balancing covariates between treatment groups (binary)
#and not requesting a target population
(ow4b <- optweight(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = 0,
                targets = NULL,
                estimand = NULL))
bal.tab(ow4b, disp.means = TRUE)



