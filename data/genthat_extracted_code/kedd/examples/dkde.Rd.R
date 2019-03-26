library(kedd)


### Name: dkde
### Title: Derivatives of Kernel Density Estimator
### Aliases: dkde dkde.default print.dkde
### Keywords: smooth nonparametric density derivative

### ** Examples

## EXAMPLE 1:  Simple example of a Gaussian density derivative

x <- rnorm(100)
dkde(x,deriv.order=0)  ## KDE of f
dkde(x,deriv.order=1)  ## KDDE of d/dx f
dkde(x,deriv.order=2)  ## KDDE of d^2/x^2 f
dkde(x,deriv.order=3)  ## KDDE of d^3/x^3 f
dev.new()
par(mfrow=c(2,2))
plot(dkde(x,deriv.order=0))
plot(dkde(x,deriv.order=1))
plot(dkde(x,deriv.order=2))
plot(dkde(x,deriv.order=3))

## EXAMPLE 2: Bimodal Gaussian density derivative
## show the kernels in the dkde parametrization

fx  <- function(x) 0.5 * dnorm(x,-1.5,0.5) + 0.5 * dnorm(x,1.5,0.5)
fx1 <- function(x) 0.5 *(-4*x-6)* dnorm(x,-1.5,0.5) + 0.5 *(-4*x+6) * 
                   dnorm(x,1.5,0.5)
				   
## 'h = 0.3' ; 'Derivative order = 0'

kernels <- eval(formals(dkde.default)$kernel)
dev.new()
plot(dkde(bimodal,h=0.3),sub=paste("Derivative order = 0",";",
     "Bandwidth =0.3 "),ylim=c(0,0.5), main = "Bimodal Gaussian Density")
for(i in 2:length(kernels))
   lines(dkde(bimodal, h = 0.3, kernel =  kernels[i]), col = i)
curve(fx,add=TRUE,lty=8)
legend("topright", legend = c(TRUE,kernels), col = c("black",seq(kernels)),
          lty = c(8,rep(1,length(kernels))),cex=0.7, inset = .015)
	   
## 'h = 0.6' ; 'Derivative order = 1'

kernels <- eval(formals(dkde.default)$kernel)[-3]
dev.new()
plot(dkde(bimodal,deriv.order=1,h=0.6),main = "Bimodal Gaussian Density Derivative",sub=paste
         ("Derivative order = 1",";","Bandwidth =0.6"),ylim=c(-0.6,0.6))
for(i in 2:length(kernels))
   lines(dkde(bimodal,deriv.order=1, h = 0.6, kernel =  kernels[i]), col = i)
curve(fx1,add=TRUE,lty=8)
legend("topright", legend = c(TRUE,kernels), col = c("black",seq(kernels)),
          lty = c(8,rep(1,length(kernels))),cex=0.7, inset = .015)



