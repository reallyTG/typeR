library(NNMIS)


### Name: print.nnmi
### Title: Print function for object of 'nnmi' class.
### Aliases: print.nnmi

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

# print
imp.dat




