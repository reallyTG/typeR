library(qvcalc)


### Name: worstErrors
### Title: Accuracy of a Quasi-variance Approximation
### Aliases: worstErrors
### Keywords: regression models

### ** Examples

##  Overdispersed Poisson loglinear model for ship damage data
##  from McCullagh and Nelder (1989), Sec 6.3.2
library(MASS)
data(ships)
ships$year <- as.factor(ships$year)
ships$period <- as.factor(ships$period)
shipmodel <- glm(formula = incidents ~ type + year + period,
    family = quasipoisson, 
    data = ships, subset = (service > 0), offset = log(service))
shiptype.qvs <- qvcalc(shipmodel, "type")
summary(shiptype.qvs, digits = 4)
worstErrors(shiptype.qvs)



