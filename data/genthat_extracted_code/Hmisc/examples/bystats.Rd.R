library(Hmisc)


### Name: bystats
### Title: Statistics by Categories
### Aliases: bystats print.bystats latex.bystats bystats2 print.bystats2
###   latex.bystats2
### Keywords: category

### ** Examples

## Not run: 
##D bystats(sex==2, county, city)
##D bystats(death, race)
##D bystats(death, cut2(age,g=5), race)
##D bystats(cholesterol, cut2(age,g=4), sex, fun=median)
##D bystats(cholesterol, sex, fun=quantile)
##D bystats(cholesterol, sex, fun=function(x)c(Mean=mean(x),Median=median(x)))
##D latex(bystats(death,race,nmiss=FALSE,subset=sex=="female"), digits=2)
##D f <- function(y) c(Hazard=sum(y[,2])/sum(y[,1]))
##D # f() gets the hazard estimate for right-censored data from exponential dist.
##D bystats(cbind(d.time, death), race, sex, fun=f)
##D bystats(cbind(pressure, cholesterol), age.decile, 
##D         fun=function(y) c(Median.pressure   =median(y[,1]),
##D                           Median.cholesterol=median(y[,2])))
##D y <- cbind(pressure, cholesterol)
##D bystats(y, age.decile, 
##D         fun=function(y) apply(y, 2, median))   # same result as last one
##D bystats(y, age.decile, fun=function(y) apply(y, 2, quantile, c(.25,.75)))
##D # The last one computes separately the 0.25 and 0.75 quantiles of 2 vars.
##D latex(bystats2(death, race, sex, fun=table))
## End(Not run)



