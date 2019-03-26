library(NNMIS)


### Name: NNMIS
### Title: Nearest Neighbor Based Multiple Imputation for Survival Data
###   with Mssing Covariates (NNMIS)
### Aliases: NNMIS

### ** Examples

# load required packages
library(NNMIS)
library(survival)

# load data set - stanford2 in package 'survival'
data("stanford2")
head(stanford2)
attach(stanford2)

# performance multiple imputation on missing covariate t5
imp.dat <- NNMIS(t5, xa=age, xb=age, time=time, event=status, Seed = 1234, mc.core=1)

# check imputation results
head(imp.dat$dat.NNMI)

# this program can impute survival times for censored observations based
# on the imputed missing covariate values

## Not run: 
##D imp.dat <- NNMIS(t5, xa=age, xb=age, time=time, event=status, imputeCT=TRUE, Seed = 1234)
##D #check imputation results
##D head(imp.dat$dat.NNMI)    # imputed missing covariate values
##D head(imp.dat$dat.T.NNMI)  # imputed survival times
##D head(imp.dat$dat.Id.NNMI) # censoring indicator
## End(Not run)




