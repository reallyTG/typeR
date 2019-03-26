library(DREGAR)


### Name: dregar2
### Title: Estimating (just) adaptive-DREGAR coefficients using an
###   iterative 2-step procedure
### Aliases: dregar2

### ** Examples

par(mfrow=c(2,2))
  m=sim.dregar(n=500 ,  beta=1:4, phi=generateAR(2), theta=.3, 
               n.z.coeffs=3 , plot=TRUE) # generating data
  r=dregar2(data = m$rawdata,da = 1:3,ar = 1:2,mselection = 4,
            penalized = 1 )# estimating parameters using2-step adaptive-DREGAR
  round(cbind(
    true      = c(phi=c(m$phi,0),theta=c(m$theta,0),beta=m$beta),
    estimates = c(phi=r$phi,theta=r$theta,beta=r$beta)
  )
  ,3
  )
  plot(r$obj)
  acf(r$res, main='Residual ACF')
  pacf(r$res,main='Residual PACF')



