library(EQUIVNONINF)


### Name: mwtie_xy
### Title: Distribution-free two-sample equivalence test for tied data:
###   test statistic and critical upper bound
### Aliases: mwtie_xy
### Keywords: Mann-Whitney functional nonparametric two-sample equivalence
###   test tied observations U-statistics estimators asymptotic normality

### ** Examples

x <- c(1,1,3,2,2,3,1,1,1,2)
y <- c(2,1,2,2,1,1,2,2,2,1,1,2)
mwtie_xy(0.05,10,12,0.10,0.10,x,y)



