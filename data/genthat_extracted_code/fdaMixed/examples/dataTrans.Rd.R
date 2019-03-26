library(fdaMixed)


### Name: dataTrans
### Title: Scale invariant Box-Cox transformation
### Aliases: dataTrans
### Keywords: manip

### ** Examples

# ----------------------------------------------------
# Make 3 samples with the following characteristics:
#   1) length N=500
#   2) sinusoid form + linear fixed effect + noise
#   3) exponential transformed
# ----------------------------------------------------

N <- 500
sample.time <- seq(0,2*pi,length.out=N)
z <- c("a","b","c")
x0 <- c(0,10,20)
x1 <- rep(x0,each=N)
y <- c(sin(sample.time),sin(sample.time),sin(sample.time))+x1+rnorm(3*N)

# Make exponential-Box-Cox-backtransformation
# Scaling with geometric mean requires that we solve the Whiteker function
geoMean <- mean(y)
geoMean <- uniroot(function(x){x*log(x)-geoMean},c(exp(-1),(1+geoMean)^2))$root
y <- dataTrans(y,0,"b",geoMean)

# ----------------------------------------------------
# Do fda's with global and marginal fixed effects
# Also seek to find Box-Cox transformation with mu=0
# ----------------------------------------------------

est0 <- fdaLm(y|z~x0,boxcox=1)
est1 <- fdaLm(y|z~x1,boxcox=1)

# -----------------------------------------------------
# Display results
# -----------------------------------------------------

# Panel 1
plot(sample.time,dataTrans(est0$betaHat[,"(Intercept)"]+est0$betaHat[,"x0"],
                           est0$boxcoxHat,"b",geoMean)/
                 dataTrans(est0$betaHat[,"(Intercept)"],est0$boxcoxHat,"b",geoMean),
     main="Effect of x (true=1.2)",xlab="time",
     ylab="response ratio")
abline(h=dataTrans(est1$betaHat["(Intercept)"]+est1$betaHat["x1"],
                   est1$boxcoxHat,"b",geoMean)/
         dataTrans(est1$betaHat["(Intercept)"],est1$boxcoxHat,"b",geoMean),col=2)
legend("topleft",c("marginal","global"),pch=c(1,NA),lty=c(NA,1),col=1:2)

# Panel 2
plot(sample.time,dataTrans(est0$betaHat[,"(Intercept)"]+est0$betaHat[,"x0"],
                           est0$boxcoxHat,"b",geoMean)-
                 dataTrans(est0$betaHat[,"(Intercept)"],est0$boxcoxHat,"b",geoMean),
     main="Effect of x (true=1)",xlab="time",
     ylab="response difference")
abline(h=dataTrans(est1$betaHat["(Intercept)"]+est1$betaHat["x1"],
                   est1$boxcoxHat,"b",geoMean)-
         dataTrans(est1$betaHat["(Intercept)"],est1$boxcoxHat,"b",geoMean),col=2)
legend("bottomleft",c("marginal","global"),pch=c(1,NA),lty=c(NA,1),col=1:2)

# Panel 3
plot(sample.time,est0$xBLUP[,1,1],type="l",
     main="Marginal ANOVA",xlab="time",ylab="x BLUP")

# Panel 4
plot(sample.time,est1$xBLUP[,1,1],type="l",
     main="Global ANOVA",xlab="time",ylab="x BLUP")
     



