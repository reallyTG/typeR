library(DREGAR)


### Name: dregar6
### Title: Estimating adaptive/non-adaptive DREGAR coefficients using an
###   iterative 6-step procedure
### Aliases: dregar6

### ** Examples

 par(mfrow=c(2,2))
  m=sim.dregar(n=500 ,  beta=1:4, phi=generateAR(2), theta=.1, 
               n.z.coeffs=3 , plot=TRUE) # generating data
  r=dregar6(data=m$rawdata, da = 1:3,
      ar = 1:2,mselection = 4,
      type='alasso')# estimating parameters using (non-apdative) DREGAR 
  round(cbind(
    true      = c(phi=c(m$phi,0),theta=c(m$theta,0),beta=m$beta),
    estimates = c(phi=r$phi,theta=r$theta,beta=r$beta)
  )
  ,3
  )
  plot(r$mod.phi,main='phi')
  plot(r$mod.theta,main='theta')
  plot(r$mod.beta,main='beta')



