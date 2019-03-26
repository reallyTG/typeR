library(oglmx)


### Name: oglmx
### Title: Fit Ordered Generalized Linear Model.
### Aliases: oglmx nobs.oglmx coef.oglmx coef.summary.oglmx oglmx.fit

### ** Examples

# create random sample, three variables, two binary.
set.seed(242)
n<-250
x1<-sample(c(0,1),n,replace=TRUE,prob=c(0.75,0.25))
x2<-vector("numeric",n)
x2[x1==0]<-sample(c(0,1),n-sum(x1==1),replace=TRUE,prob=c(2/3,1/3))
z<-rnorm(n,0.5)
# create latent outcome variable
latenty<-0.5+1.5*x1-0.5*x2+0.5*z+rnorm(n,sd=exp(0.5*x1-0.5*x2))
# observed y has four possible values: -1,0,1,2
# threshold values are: -0.5, 0.5, 1.5.
y<-vector("numeric",n)
y[latenty< -0.5]<--1
y[latenty>= -0.5 & latenty<0.5]<- 0
y[latenty>= 0.5 & latenty<1.5]<- 1
y[latenty>= 1.5]<- 2
dataset<-data.frame(y,x1,x2)
# estimate standard ordered probit
results.oprob<-oglmx(y ~ x1 + x2 + z, data=dataset,link="probit",constantMEAN=FALSE,
                     constantSD=FALSE,delta=0,threshparam=NULL)
coef(results.oprob) # extract estimated coefficients
summary(results.oprob)
# calculate marginal effects at means
margins.oglmx(results.oprob)
# estimate ordered probit with heteroskedasticity
results.oprobhet<-oglmx(y ~ x1 + x2 + z, ~ x1 + x2, data=dataset, link="probit",
                     constantMEAN=FALSE, constantSD=FALSE,threshparam=NULL)
summary(results.oprobhet)
library("lmtest")
# likelihood ratio test to compare model with and without heteroskedasticity.
lrtest(results.oprob,results.oprobhet)
# calculate marginal effects at means.
margins.oglmx(results.oprobhet)
# scale of parameter values is meaningless. Suppose instead two of the 
# three threshold values were known, then can include constants in the 
# mean and standard deviation equation and the scale is meaningful.
results.oprobhet1<-oglmx(y ~ x1 + x2 + z, ~ x1 + x2, data=dataset, link="probit",
                        constantMEAN=TRUE, constantSD=TRUE,threshparam=c(-0.5,0.5,NA))
summary(results.oprobhet1)
margins.oglmx(results.oprobhet1)
# marginal effects are identical to results.oprobithet, but using the true thresholds
# means the estimated parameters are on the same scale as underlying data.
# can choose any two of the threshold values and get broadly the same result.
results.oprobhet2<-oglmx(y ~ x1 + x2 + z, ~ x1 + x2, data=dataset, link="probit",
                         constantMEAN=TRUE, constantSD=TRUE,threshparam=c(-0.5,NA,1.5))
summary(results.oprobhet2)
margins.oglmx(results.oprobhet2)
# marginal effects are again identical. Parameter estimates do change.



