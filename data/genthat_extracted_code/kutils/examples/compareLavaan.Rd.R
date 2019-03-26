library(kutils)


### Name: compareLavaan
### Title: Prepare a table to compare fit measures of confirmatory factor
###   analyses (CFA)
### Aliases: compareLavaan

### ** Examples

## No test: 
## These run longer than 5 seconds
library(lavaan)
library(xtable)
set.seed(123)
genmodel <- "f1 =~ .7*v1 + .7*v2 + .7*v3 + .7*v4 + .7*v5 + .7*v6
f1 ~~ 1*f1"
genmodel2 <- "f1 =~ .7*v1 + .7*v2 + .7*v3 + .7*v4 + .7*v5 + .2*v6
f1 ~~ 1*f1"

dat1 <- simulateData(genmodel, sample.nobs = 300)
dat2 <- simulateData(genmodel2, sample.nobs = 300)
dat1$group <- 0
dat2$group <- 1
dat <- rbind(dat1, dat2)

congModel <- "
              f1 =~ 1*v1 + v2 + v3 + v4 + v5 + v6
    		  f1 ~~ f1
    		  f1 ~0*1
    		 "
weakModel <- "
              f1 =~ 1*v1 + c(L2,L2)*v2 + c(L3,L3)*v3 + c(L4,L4)*v4 + c(L5,L5)*v5 + c(L6,L6)*v6
    		  f1 ~~ f1
    		  f1 ~0*1
    		"
partialweakModel <- "
              f1 =~ 1*v1 + c(L2,L2)*v2 + c(L3,L3)*v3 + c(L4,L4)*v4 + c(L5,L5)*v5 + v6
    		  f1 ~~ f1
    		  f1 ~0*1
    		"
partialweakModel2 <- "
              f1 =~ 1*v1 + c(L2,L2)*v2 + c(L3,L3)*v3 + c(L4,L4)*v4 + v5 + v6
    		  f1 ~~ f1
    		  f1 ~0*1
    		"
partialstrongModel1 <- "
              f1 =~ 1*v1 + c(L2,L2)*v2 + c(L3,L3)*v3 + c(L4,L4)*v4 + c(L5,L5)*v5 + v6
    		  f1 ~~ f1
    		  f1 ~ c(0,NA)*1
    		  v1 ~ c(I1,I1)*1
    		  v2 ~ c(I2,I2)*1
    		  v3 ~ c(I3,I3)*1
    		  v4 ~ c(I4,I4)*1
    		  v5 ~ c(I5,I5)*1
    		  v6 ~ c(I6,I6)*1
    		"
cc1 <- cfa(congModel, data=dat, group="group", meanstructure=TRUE, estimator = "MLR")
cc2 <- cfa(weakModel, data=dat, group="group", meanstructure=TRUE, estimator = "MLR")
cc21 <- cfa(partialweakModel, data=dat, group="group", meanstructure=TRUE, estimator = "MLR")
cc3 <- cfa(partialstrongModel1, data=dat, group="group", meanstructure=TRUE, estimator = "MLR")

models <- list(cc1, cc2, cc21, cc3)
## Note, nesting is not specified, so built-in nesting detection applies
compareLavaan(models)
compareLavaan(models, type = "latex")
compareLavaan(models, type = "html")

## Now we specify model labels in the list
models <- list("Configural" = cc1, "Metric" = cc2, "PartialMetric" = cc21, "Scalar" = cc3)
## The model labels are used in the nesting parameter
compareLavaan(models, nesting = "Configural > Metric + PartialMetric > Scalar")

compareLavaan(models, fitmeas = c("chisq", "df", "cfi", "rmsea", "tli"),
            nesting = "Configural > Metric + PartialMetric > Scalar")

## Creates output file
## compareLavaan(models, fitmeas = c("chisq", "df", "cfi", "rmsea", "tli"),
## nesting = "Configural > Metric + PartialMetric > Scalar", type = "tex",
## file = "/tmp/table.tex")
## End(No test)



