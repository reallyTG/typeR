library(Sim.DiffProc)


### Name: fptsde1d
### Title: Approximate densities and random generation for first passage
###   time in 1-D SDE
### Aliases: fptsde1d fptsde1d.default summary.fptsde1d print.fptsde1d
###   mean.fptsde1d Median.fptsde1d Mode.fptsde1d quantile.fptsde1d
###   kurtosis.fptsde1d skewness.fptsde1d moment.fptsde1d cv.fptsde1d
###   max.fptsde1d min.fptsde1d dfptsde1d dfptsde1d.default print.dfptsde1d
###   plot.dfptsde1d
### Keywords: fpt sde ts

### ** Examples


## Example 1: Ito SDE
## dX(t) = -4*X(t) *dt + 0.5*dW(t)
## S(t) = 0 (constant boundary)
set.seed(1234)

# SDE 1d
f <- expression( -4*x )
g <- expression( 0.5 )
mod <- snssde1d(drift=f,diffusion=g,x0=2,M=1000)

# boundary
St <- expression(0) 

# random
out <- fptsde1d(mod, boundary=St)
out
summary(out)
# density approximate
den <- dfptsde1d(out)
den
plot(den)

## Example 2: Stratonovich SDE
## dX(t) = 0.5*X(t)*t *dt + sqrt(1+X(t)^2) o dW(t)
## S(t) = -0.5*sqrt(t) + exp(t^2) (time-dependent boundary)
set.seed(1234)

# SDE 1d
f <- expression( 0.5*x*t )
g <- expression( sqrt(1+x^2) )
mod2 <- snssde1d(drift=f,diffusion=g,x0=2,M=1000,type="srt")

# boundary
St <- expression(-0.5*sqrt(t)+exp(t^2))

# random
out2 <- fptsde1d(mod2,boundary=St)
out2
summary(out2)
# density approximate
plot(dfptsde1d(out2,bw='ucv'))


## Example 3: fptsde1d vs fptdApproximate
## Not run: 
##D f <- expression( -0.5*x+0.5*5 )
##D g <- expression( 1 )
##D St <- expression(5+0.25*sin(2*pi*t)) 
##D mod <- snssde1d(drift=f,diffusion=g,boundary=St,x0=3,T=10,N=10^4,M =10000)
##D mod
##D 
##D # random
##D out3 <- fptsde1d(mod,boundary=St)
##D out3
##D summary(out3)
##D # density approximate: 
##D library("fptdApprox")
##D # Under `fptdApprox':
##D # Define the diffusion process and give its transitional density:
##D OU <- diffproc(c("alpha*x + beta","sigma^2",
##D "dnorm((x-(y*exp(alpha*(t-s)) - beta*(1 - exp(alpha*(t-s)))/alpha))/
##D (sigma*sqrt((exp(2*alpha*(t-s)) - 1)/(2*alpha))),0,1)/
##D (sigma*sqrt((exp(2*alpha*(t-s)) - 1)/(2*alpha)))",
##D "pnorm(x, y*exp(alpha*(t-s)) - beta*(1 - exp(alpha*(t-s)))/alpha,
##D sigma*sqrt((exp(2*alpha*(t-s)) - 1)/(2*alpha)))"))
##D # Approximate the first passgage time density for OU, starting in X_0 = 3
##D # passing through 5+0.25*sin(2*pi*t) on the time interval [0,10]:
##D res <- Approx.fpt.density(OU, 0, 10, 3,"5+0.25*sin(2*pi*t)", list(alpha=-0.5,beta=0.5*5,sigma=1))
##D 
##D ##
##D plot(dfptsde1d(out3,bw='ucv'),main = 'fptsde1d vs fptdApproximate')
##D lines(res$y~res$x, type = 'l',lwd=2)
##D legend('topright', lty = c('solid', 'dashed'), col = c(1, 2),
##D        legend = c('fptdApproximate', 'fptsde1d'), lwd = 2, bty = 'n')
##D 
## End(Not run)




