library(R330)


### Name: salary.df
### Title: Study of Supervisor Performance
### Aliases: salary.df
### Keywords: datasets

### ** Examples

data(salary.df)
salary.lm<-lm(Y~X1+X2+X3+X4+X5,data=salary.df)
resids<-residuals(salary.lm)
pred<-fitted.values(salary.lm)
plot(pred,resids,type="n")
ncases<-length(resids)
text(pred,resids,1:ncases)



