library(BayesGESM)


### Name: gesm
### Title: Generalized Elliptical Semi-parametric Models
### Aliases: gesm

### ** Examples

##########   European Rabbit   ##########
#library(ssym)
#data(Erabbits)
#Erabbits2 <- Erabbits[order(Erabbits$age,Erabbits$wlens),]
#attach(Erabbits2)

#fit <- gesm(wlens ~ bsp(age) | bsp(age), family= "ContNormal", eta=c(0.8,0.9),
#				 burn.in=1000, post.sam.s=5000, thin=10)			 
#summary(fit)

##########   Plot nonparametric components for the location and dispersion parameters 
#par(mfrow=c(1,2))
#bsp.graph.gesm(fit, which=1, age, xlab="Rabbit age", ylab="f(age)", main="Location")
#bsp.graph.gesm(fit, which=2, age, xlab="Rabbit age", ylab="g(age)", main="Dispersion")
									
##########   Residual plot
#par(mfrow=c(1,2))
#plot(fit$res, ylim=c(-2,2), xlab="Index", ylab="", main="Residuals", cex=0.3,
#	 type="p", lwd=3)
#abline(h=0,lty=3)
#qqnorm(fit$res, xlim=c(-2,2), ylim=c(-2,2), xlab="Quantile", ylab="Residuals",
#	   cex=0.3, type="p", lwd=3)
#abline(0,1,lty=3)

##########   Influence measures plot
#par(mfrow=c(1,2))
#plot(fit$KL, xlab="Index", ylab="", main="K-L divergence", cex=0.3, type="p", lwd=3)
#abline(h=3*mean(fit$KL))
#plot(fit$X_2, xlab="Index", ylab="", main="X2 divergence", cex=0.3, type="p", lwd=3)
#abline(h=3*mean(fit$X_2))



