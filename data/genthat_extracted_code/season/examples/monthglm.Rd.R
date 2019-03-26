library(season)


### Name: monthglm
### Title: Fit a GLM with Month
### Aliases: monthglm print.monthglm

### ** Examples

data(CVD)
mmodel = monthglm(formula=cvd~1 ,data=CVD, family=poisson(),
                  offsetpop=expression(pop/100000), offsetmonth=TRUE)
summary(mmodel)



