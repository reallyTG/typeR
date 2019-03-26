library(fishmove)


### Name: fishmove.estimate
### Title: Estimation of fish movement parameters (sigma_stat, sigma_mob
###   and p) from field data
### Aliases: fishmove.estimate

### ** Examples

	# Fictive fish movement data e.g. from a telemetry study (displacement distances)
  set.seed(42)
  fielddata <- c(rnorm(mean=0,sd=50,300),rnorm(mean=0,sd=700,200))  
  
  # extracting parameters using \code{fishmove.estimate}
  parameters <- fishmove.estimate(fielddata)
  parameters

  # Plot
  hist(fielddata,breaks=30,freq=FALSE)


  # Definition of probability density function based on two superimposed normal distributions
  # ddoublenorm <- function(x,sigma_stat,sigma_mob,p){
  #		dnorm(x,mean=0,sd=sigma_stat)*p+
  #		dnorm(x,mean=0,sd=sigma_mob)*(1-p)}

  #x <- seq(min(fielddata),max(fielddata),length.out=1000)


  #lines(x,
  #		ddoublenorm(x,
  #			parameters$estimate["sigma_stat"],
  #			parameters$estimate["sigma_mob"],
  #			parameters$estimate["p"]),
  #		col="red")




