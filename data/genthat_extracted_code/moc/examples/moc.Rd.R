library(moc)


### Name: moc
### Title: Fit a General Nonlinear Multivariate Mixture Model (MOC)
### Aliases: moc update.moc
### Keywords: models nonlinear cluster classif multivariate

### ** Examples


data(moc.dat)

cnorm.dat<-list()   #This is used as a container for functions and data

# Censored Normal (marginal density)

cnorm<-function(x,mu,sig,min,max)
{mi<-(x == min)*1
ma<-(x == max)*1
mi*pnorm((min-mu)/sig)+ma*(1-pnorm((max-mu)/sig))+
(1-mi-ma)*dnorm((x-mu)/sig)/sig}

# For this data set the range of the dependent variables is [0,14]

cnorm.dat$cnorm1<-function(x,mu,sig,...) {cnorm(x,mu,sig,0,14)}

# We have 4 observations

cnorm.dat$gmu1<- list(
  Group1 = function(pmu) {t(1)%*%rep(pmu[1],4)},
  Group2 = function(pmu) {t(1)%*%rep(pmu[2],4)},
  Group3 = function(pmu) {t(1)%*%rep(pmu[3],4)})

attr(cnorm.dat$gmu1,"parameters")<-c("  cons1","  cons2","  cons3")

# Expected value of a general censored normal

cmean<-function(mu,sig,min,max) {
max-(max-mu)*pnorm((max-mu)/sig)+(min-mu)*pnorm((min-mu)/sig)-
sig*(dnorm((max-mu)/sig)-dnorm((min-mu)/sig)) }

# Homogeneous variances

cnorm.dat$gshape1<- list(
  Group1 = function(psh) {t(1)%*%rep(exp(psh[1]),4)},
  Group2 = function(psh) {t(1)%*%rep(exp(psh[1]),4)},
  Group3 = function(psh) {t(1)%*%rep(exp(psh[1]),4)})

attr(cnorm.dat$gshape1,"parameters")<-c("  log(std.dev)")

cnorm.dat$cmean1<- list(
  Group1 = function(p) {cmean(cnorm.dat$gmu1[[1]](p[1:3]),cnorm.dat$gshape1[[1]](p[4]),0,14) },
  Group2 = function(p) {cmean(cnorm.dat$gmu1[[2]](p[1:3]),cnorm.dat$gshape1[[2]](p[4]),0,14) },
  Group3 = function(p) {cmean(cnorm.dat$gmu1[[3]](p[1:3]),cnorm.dat$gshape1[[3]](p[4]),0,14) })

moc1<-
moc(moc.dat[,1:4],density=cnorm1,groups=3,gmu=gmu1,gshape=gshape1,
expected=cmean1,pgmu=c(0.5, 2, 5),pgshape=c(0.7),pgmix=c(-0.6, -2.0),
data=cnorm.dat,gradtol=1E-4)

print(moc1)

## Not run: 
##D # Heterogeneous variances across mixture groups
##D 
##D cnorm.dat$gshape2<-list(
##D   Group1 = function(psh) {t(1)%*%rep(exp(psh[1]),4)},
##D   Group2 = function(psh) {t(1)%*%rep(exp(psh[2]),4)},
##D   Group3 = function(psh) {t(1)%*%rep(exp(psh[3]),4)})
##D 
##D cnorm.dat$cmean2<-list(
##D   Group1 = function(p) {cmean(cnorm.dat$gmu1[[1]](p[1:3]),cnorm.dat$gshape2[[1]](p[4:6]),0,14) },
##D   Group2 = function(p) {cmean(cnorm.dat$gmu1[[2]](p[1:3]),cnorm.dat$gshape2[[2]](p[4:6]),0,14) },
##D   Group3 = function(p) {cmean(cnorm.dat$gmu1[[3]](p[1:3]),cnorm.dat$gshape2[[3]](p[4:6]),0,14) })
##D 
##D moc2<-
##D moc(moc.dat[,1:4],density=cnorm1,groups=3,gmu=gmu1,gshape=gshape2,
##D expected=cmean2,pgmu=moc1$coef[1:3],pgshape=c(rep(moc1$coef[4],3)),
##D pgmix=moc1$coef[5:6],data=cnorm.dat,gradtol=1E-4)
##D 
## End(Not run)
# Heterogeneous variances across time

cnorm.dat$gshape3<-list(
  Group1 = function(psh) {exp(t(1)%*%psh[1:4])},
  Group2 = function(psh) {exp(t(1)%*%psh[1:4])},
  Group3 = function(psh) {exp(t(1)%*%psh[1:4])})

cnorm.dat$cmean3<-list(
  Group1 = function(p) {cmean(cnorm.dat$gmu1[[1]](p[1:3]),cnorm.dat$gshape3[[1]](p[4:7]),0,14)},
  Group2 = function(p) {cmean(cnorm.dat$gmu1[[2]](p[1:3]),cnorm.dat$gshape3[[2]](p[4:7]),0,14)},
  Group3 = function(p) {cmean(cnorm.dat$gmu1[[3]](p[1:3]),cnorm.dat$gshape3[[3]](p[4:7]),0,14)})

moc3<-
moc(moc.dat[,1:4],density=cnorm1,groups=3,gmu=gmu1,gshape=gshape3,
expected=cmean3,pgmu=moc1$coef[1:3],pgshape=c(rep(moc1$coef[4],4)),
pgmix=moc1$coef[5:6],data=cnorm.dat,gradtol=1E-4)

print(moc3)

cnorm.dat$ages<-cbind(1.7,3,4.2,5.6)

## Not run: 
##D # Last group is a linear function of time
##D 
##D cnorm.dat$gmu1t<-list(
##D   Group1 = function(pmu) {pmu[1]*cnorm.dat$ages^0},
##D   Group2 = function(pmu) {pmu[2]+pmu[3]*cnorm.dat$ages},
##D   Group3 = function(pmu) {pmu[4]*cnorm.dat$ages^0})
##D 
##D cnorm.dat$cmean1t<-list(
##D   Group1 = function(p) {cmean(cnorm.dat$gmu1t[[1]](p[1:4]),cnorm.dat$gshape1[[1]](p[5]),0,14)},
##D   Group2 = function(p) {cmean(cnorm.dat$gmu1t[[2]](p[1:4]),cnorm.dat$gshape1[[2]](p[5]),0,14)},
##D   Group3 = function(p) {cmean(cnorm.dat$gmu1t[[3]](p[1:4]),cnorm.dat$gshape1[[3]](p[5]),0,14)})
##D 
##D moc4<-
##D moc(moc.dat[,1:4],density=cnorm1,groups=3,gmu=gmu1t,gshape=gshape1,
##D expected=cmean1t,pgmu=append(moc1$coef[1:3],0,after=2),
##D pgshape=c(moc1$coef[4]),pgmix=moc1$coef[5:6],data=cnorm.dat,gradtol=1E-4)
##D 
##D 
##D # Zero inflated Poisson log-linear in time for the third group
##D # Be careful dpois requires integer values
##D 
##D zip<- function(x,la,shape=1,extra)
##D { mix<- exp(extra)/(1+exp(extra))
##D   mix*(x == 0)+(1-mix)*dpois(x,la) }
##D 
## End(Not run)


gmup<-list(
  Group1 = function(pmu) {exp(pmu[1]*cnorm.dat$ages^0)},
  Group2 = function(pmu) {exp(pmu[2]+pmu[3]*cnorm.dat$ages)},
  Group3 = function(pmu) {exp(pmu[4]*cnorm.dat$ages^0)})

## Not run: 
##D zipfit<-list(
##D   Group1 = function(p) { gmup[[1]](p)/(1+exp(p[5]))},
##D   Group2 = function(p) { gmup[[2]](p)/(1+exp(p[5]))},
##D   Group3 = function(p) { gmup[[3]](p)/(1+exp(p[5]))})
##D 
##D gextrap<-list(
##D   Group1 = function(pxt) {t(1)%*%rep(pxt[1],4)},
##D   Group2 = function(pxt) {t(1)%*%rep(pxt[1],4)},
##D   Group3 = function(pxt) {t(1)%*%rep(pxt[1],4)})
##D 
##D moc5<-
##D moc(moc.dat[,1:4],density=zip,groups=3,gmu=gmup,gextra=gextrap,
##D expected = zipfit,pgmu=c(-0.6, 0.64,0, 1.6),pgextra=c(-3),
##D pgmix=c(-0.7, -2), gradtol=1E-4)
##D 
## End(Not run)

# Standard Poisson with mixture depending on time independent
# dichotomous covariate
# Be aware that dpoiss require integer values

dumm<-moc.dat[,5]-1
gmixt<-function(pm){
mix<-cbind(1,dumm)%*%matrix(pm[1:4],2,2)
cbind(1,exp(mix))/(1+apply(exp(mix),1,sum))}

poiss<-function(x,la,...) {dpois(x,la)}

moc6<-
moc(moc.dat[,1:4],density=poiss,groups=3,gmu=gmup,gmixture=gmixt,
pgmu=c(-0.7,2.0, 0, 1.5),pgmix=c(-0.2,-1, -1 ,-2),gradtol=1E-4)

print(moc6)

obsfit.moc(moc6,along=dumm)

entropy(moc1,moc3,moc6)

## Not run: 
##D plot(moc6,against=cnorm.dat$ages,main="MOC profiles",xlab="age",ylab="Y")
##D plot(residuals(moc6))
##D 
## End(Not run)

#More extended examples are available in the Examples directory of the package.



