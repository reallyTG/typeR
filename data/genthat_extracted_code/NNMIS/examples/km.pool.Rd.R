library(NNMIS)


### Name: km.pool
### Title: Perform Kaplan-Meier estmation over the multiply imputed
###   survival data sets
### Aliases: km.pool

### ** Examples


# load required packages
library(NNMIS)
library(survival)

# load data set - stanford2 in package 'survival'
data("stanford2")
head(stanford2)
attach(stanford2)

# performance multiple imputation on missing covariate t5 and
# censored observations based on the imputed missing covariates
imp.dat <- NNMIS(t5, xa=age, xb=age, time=time, event=status, imputeCT=TRUE, Seed = 1234)

# check imputation results
head(imp.dat$dat.T.NNMI)

# combine inference from imputed data sets using Rubin's rules
# Kaplan-Meier estimates
kmfit <- km.pool(imp.dat, time, status)
plotKM(kmfit)




