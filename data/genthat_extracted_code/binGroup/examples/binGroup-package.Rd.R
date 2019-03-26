library(binGroup)


### Name: binGroup-package
### Title: Statistical Methods for Group Testing.
### Aliases: binGroup-package binGroup
### Keywords: package regression models htest Categorical Data Optimization

### ** Examples


# 1) One-sample problem

# 1.1) Confidence intervals for designs with equal group size (pool size),
# where 
#  n denotes the number of groups (pools),
#  s denotes the common group size (number of individuals pooled per group),
#  y denotes the number of groups tested positive.

# The following call reproduces the example given 
# by Tebbs and Bilder (2004) for the two-sided 95-percent 
# exact (Clopper-Pearson) interval:

bgtCI(n=24, y=3, s=7, conf.level=0.95,
 alternative="two.sided", method="CP")

# 1.2) Confidence intervals for designs with unequal group size (pool size):
# Keeping notation as above but allowing for (a limited number of) different
# group size s, the examples given in Hepworth (1996), Table 5 can be 
# reproduced by calling:

 bgtvs(n=c(2,3), s=c(5,2), y=c(0,0))
 bgtvs(n=c(2,3), s=c(5,2), y=c(0,1))

# The function pooledBin provides different methods for the same problem,
# where x is the number of positive groups, m is the size of the groups and
# n is the number of groups with the correesponding sizes:

pooledBin(x=c(0,1), m=c(5,2), n=c(2,3), ci.method="score")
pooledBin(x=c(0,1), m=c(5,2), n=c(2,3), ci.method="lrt")
pooledBin(x=c(0,1), m=c(5,2), n=c(2,3), ci.method="bc-skew-score")

# 1.3) For experimental design based on the bias of the point estimate,
# as proposed by Swallow (1985): The values in Table 1 (Swallow, 1985),
# p.885 can be reproduced by calling:

estDesign(n=10, smax=100, p.tr=0.001)
estDesign(n=10, smax=100, p.tr=0.01)

# 2) Two-sample comparison

# Assume a design, where pools 5, 1, 1, 30, and 20 pools of size 10, 4, 1, 25, 50, 
# respectively, are used to estimate the prevalence in two populations.
# In population 1, one out of 5 pools with 10 units is positive,
# while in population 2, two out of five pools with 10 units is positive as well as 
# the one pool with only 1 unit.
# The difference of proportions is to be estimated.

x1 <- c(1,0,0,0,0)
m1 <- c(10,4,1,25,50)
n1 <- c(5,1,1,30,20)

x2 <- c(2,0,1,0,0)
m2 <- c(10,4,1,25,50)
n2 <- c(5,1,1,30,20)

pooledBinDiff(x1=x1, m1=m1,x2=x2, m2=m2, n1=n1, n2=n2, ci.method="lrt")


# 3) Regression models

# 3.1) Fitting a regression model
# A HIV surveillance data (used by Vansteelandt et al. 2000)
# can be analysed for the dependence of HIV prevalence
# on covariates AGE and EDUC., with sensitivity and specificity
# assumed to be 0.9 each.

data(hivsurv)
fit1 <- gtreg(formula = groupres ~ AGE + EDUC., data = hivsurv,
  groupn = gnum, sens = 0.9, spec = 0.9, method = "Xie")
summary(fit1)


# 3.2) Fitting a regression model for matrix pooling data
# The function sim.mp is used to simulate a matrix pooling data set:

set.seed(9128)
sa1a<-sim.mp(par=c(-7,0.1), n.row=c(5,4), n.col=c(6,5),
 sens=0.95, spec=0.95)

str(sa1a)
sa1<-sa1a$dframe


## Not run: 
##D fit2 <- gtreg.mp(formula = cbind(col.resp, row.resp) ~ x, data = sa1, 
##D                  coln = coln, rown = rown, arrayn = arrayn, 
##D                  sens = 0.95, spec = 0.95, n.gibbs = 2000, trace = TRUE)
##D fit2
##D summary(fit2)
## End(Not run)

# 4) Identification using hierarchical and array-based group testing algorithms

# 4.1) Finding the optimal testing configuration over a range of initial 
# group sizes, using non-informative three-stage hierarchical testing, where 
#   p denotes the overall prevalence of disease,
#   Se denotes the sensitivity of the diagnostic test, 
#   Sp denotes the specificity of the diagnostic test,
#   group.sz denotes the range of initial pool sizes for consideration, and
#   obj.fn specifies the objective functions for which to find results.

# The following call reproduces results given by Hitt et al. (2018) for 
# informative three-stage hierarchical testing with an overall disease 
# prevalence of E(p_i) = 0.01 and sensitivity and specificity equal to 0.95.

# This example takes approximately 2.5 minutes to run.

## Not run: 
##D set.seed(1002)
##D results1 <- OTC(algorithm="ID3", p=0.01, Se=0.95, Sp=0.95, group.sz=3:40, 
##D obj.fn=c("ET", "MAR"), alpha=2)
##D results1$opt.ET$OTC
##D results1$opt.ET$ET/results1$opt.ET$OTC$Stage1
##D results1$opt.MAR$OTC
##D results1$opt.MAR$ET/results1$opt.MAR$OTC$Stage1
## End(Not run)

# 4.2) Finding the optimal testing configuration using non-informative
# array testing without master pooling

# The following call reproduces results given by Hitt et al. (2018) for
# non-informative array testing without master pooling with an overall
# disease prevalence of p=0.01 and sensitivity and specificity equal 
# to 0.90.

# This example takes approximately 7 minutes to run.

## Not run: 
##D results2 <- OTC(algorithm="A2", p=0.01, Se=0.90, Sp=0.90, group.sz=3:40, 
##D obj.fn=c("ET", "MAR"))
##D results2$opt.ET$OTC
##D results2$opt.ET$ET/results2$opt.ET$OTC$Array.sz
##D results2$opt.MAR$OTC
##D results2$opt.MAR$ET/results2$opt.MAR$OTC$Array.sz
## End(Not run)




