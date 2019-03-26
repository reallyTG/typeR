library(season)


### Name: plot.monthglm
### Title: Plot of Monthly Estimates
### Aliases: plot.monthglm

### ** Examples
## No test: 
data(CVD)
mmodel = monthglm(formula=cvd~1, data=CVD, family=poisson(),
                  offsetpop=pop/100000, offsetmonth=TRUE, refmonth=6)
plot(mmodel)
## End(No test)



