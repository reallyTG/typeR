library(opticut)


### Name: opticut-package
### Title: Likelihood Based Optimal Partitioning and Indicator Species
###   Analysis
### Aliases: opticut-package
### Keywords: package

### ** Examples

## community data
y <- cbind(
    Sp1=c(4,6,3,5, 5,6,3,4, 4,1,3,2),
    Sp2=c(0,0,0,0, 1,0,0,1, 4,2,3,4),
    Sp3=c(0,0,3,0, 2,3,0,5, 5,6,3,4))

## stratification
g <-    c(1,1,1,1, 2,2,2,2, 3,3,3,3)

## find optimal partitions for each species
oc <- opticut(formula = y ~ 1, strata = g, dist = "poisson")
summary(oc)

## visualize the results
plot(oc, cut = -Inf)

## quantify uncertainty
uc <- uncertainty(oc, type = "asymp", B = 999)
summary(uc)

## go beyond binary partitions

mc <- multicut(formula = y ~ 1, strata = g, dist = "poisson")
summary(mc)

ol <- optilevels(y[,"Sp2"], as.factor(g))
ol[c("delta", "coef", "rank", "levels")]



