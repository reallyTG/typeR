library(abe)


### Name: abe
### Title: Augmented Backward Elimination
### Aliases: abe

### ** Examples

# simulate some data:

set.seed(1)
n=100
x1<-runif(n)
x2<-runif(n)
x3<-runif(n)
y<--5+5*x1+5*x2+ rnorm(n,sd=5)
dd<-data.frame(y,x1,x2,x3)

# fit a simple model containing only numeric covariates
fit<-lm(y~x1+x2+x3,x=TRUE,y=TRUE,data=dd)

# perform ABE with "x1" as only passive and "x2" as only active
# using the exact change in the estimate of 5% and significance
# using 0.2 as a threshold
abe.fit<-abe(fit,data=dd,include="x1",active="x2",
tau=0.05,exp.beta=FALSE,exact=TRUE,criterion="alpha",alpha=0.2,
type.test="Chisq",verbose=TRUE)

summary(abe.fit)

# similar example, but turn off the change-in-estimate and perform
# only backward elimination

abe.fit<-abe(fit,data=dd,include="x1",active="x2",
tau=Inf,exp.beta=FALSE,exact=TRUE,criterion="alpha",alpha=0.2,
type.test="Chisq",verbose=TRUE)

summary(abe.fit)

# an example with the model containing categorical covariates:
dd$x3<-rbinom(n,size=3,prob=1/3)
dd$y1<--5+5*x1+5*x2+ rnorm(n,sd=5)
fit<-lm(y1~x1+x2+factor(x3),x=TRUE,y=TRUE,data=dd)

# treat "x3" as a single covariate:

abe.fit.fact<-abe(fit,data=dd,include="x1",active="x2",
tau=0.05,exp.beta=FALSE,exact=TRUE,criterion="alpha",alpha=0.2,
type.test="Chisq",verbose=TRUE,type.factor="factor")

summary(abe.fit.fact)

# treat each dummy of "x3" as a separate covariate:

abe.fit.ind<-abe(fit,data=dd,include="x1",active="x2",
tau=0.05,exp.beta=FALSE,exact=TRUE,criterion="alpha",alpha=0.2,
type.test="Chisq",verbose=TRUE,type.factor="individual")

summary(abe.fit.ind)



