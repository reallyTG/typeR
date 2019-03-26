library(survPen)


### Name: smf
### Title: Defining smooths in survPen formulae
### Aliases: smf tensor tint

### ** Examples

# penalized cubic regression spline of time with 5 unspecified knots
formula.test <- ~smf(time,df=5)

# suppose that we want to fit a model from formula.test
library(survPen)
data(datCancer)

mod.test <- survPen(~smf(fu,df=5) ,data=datCancer,t1=fu,event=dead)

# then the knots can be retrieved like this:
mod.test$list.smf[[1]]$knots
# or calculated like this
quantile(unique(datCancer$fu),seq(0,1,length=5))


# penalized cubic regression splines of time and age with respectively 5 and 7 unspecified knots
formula.test2 <- ~smf(time,df=5)+smf(age,df=7)

# penalized cubic regression splines of time and age with respectively 3 and 4 specified knots
formula.test3 <- ~smf(time,knots=c(0,3,5))+smf(age,knots=c(30,50,70,90))

# penalized tensor product for time and age with respectively 5 and 4 unspecified knots leading
# to 5*4 = 20 regression parameters
formula.test <- ~tensor(time,age,df=c(5,4))

# penalized tensor product for time and age with respectively 3 and 4 specified knots
formula.test3 <- ~tensor(time,agec,knots=list(c(0,3,5),c(30,50,70,90)))

# penalized tensor product for time, age and year with respectively 6, 5 and 4 unspecified knots
formula.test <- ~tensor(time,age,year,df=c(6,5,4))

# penalized tensor product interaction for time and age with respectively 5 and 4 unspecified knots
# main effects are specified as penalized cubic regression splines
formula.test <- ~smf(time,df=5)+smf(age,df=4)+tint(time,age,df=c(5,4))




