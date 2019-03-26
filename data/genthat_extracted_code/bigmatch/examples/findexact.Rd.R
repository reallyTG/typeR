library(bigmatch)


### Name: findexact
### Title: Build an exact match variable given a matrix of covariates
###   ordered by the user according to their importance.
### Aliases: findexact

### ** Examples

data(nh0506)
attach(nh0506)
# The following example uses all of the variables in the propensity score,propens
ex<-findexact(z,cbind(female,age,education,black,hispanic,povertyr))
head(ex$miss)
head(ex$variables)
table(z,ex$NewExact)

# In order to exact match on age as well
# one option is to divide age into several levels
age_quantile<-as.integer(cut(age,quantile(age,c(0,0.25,0.5,0.75,1))))
ex2<-findexact(z,cbind(female,age_quantile,education,black,hispanic,povertyr,bmi))
head(ex2$miss)
head(ex2$variables)
table(z,ex2$NewExact)
detach(nh0506)



