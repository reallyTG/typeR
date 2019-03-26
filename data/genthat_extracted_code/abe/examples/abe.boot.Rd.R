library(abe)


### Name: abe.boot
### Title: Bootstrapped Augmented Backward Elimination
### Aliases: abe.boot

### ** Examples

# simulate some data and fit a model

set.seed(1)
n=100
x1<-runif(n)
x2<-runif(n)
x3<-runif(n)
y<--5+5*x1+5*x2+ rnorm(n,sd=5)
dd<-data.frame(y=y,x1=x1,x2=x2,x3=x3)
fit<-lm(y~x1+x2+x3,x=TRUE,y=TRUE,data=dd)

# use ABE on 50 bootstrap re-samples considering different
# change-in-estimate thresholds and significance levels

fit.boot<-abe.boot(fit,data=dd,include="x1",active="x2",
tau=c(0.05,0.1),exp.beta=FALSE,exact=TRUE,
criterion="alpha",alpha=c(0.2,0.05),type.test="Chisq",
num.boot=50,type.boot="bootstrap")

summary(fit.boot)

# use ABE on 50 subsamples randomly selecting 50% of subjects
# considering different change-in-estimate thresholds and
# significance levels

fit.boot<-abe.boot(fit,data=dd,include="x1",active="x2",
tau=c(0.05,0.1),exp.beta=FALSE,exact=TRUE,
criterion="alpha",alpha=c(0.2,0.05),type.test="Chisq",
num.boot=50,type.boot="subsampling",prop.sampling=0.5)

summary(fit.boot)



