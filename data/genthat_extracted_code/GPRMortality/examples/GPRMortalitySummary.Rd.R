library(GPRMortality)


### Name: GPRMortalitySummary
### Title: summary table for Gaussian Process Regression results
### Aliases: GPRMortalitySummary

### ** Examples

 library("rstan")
 library("GPRMortality")
 head(data.mortality)
 head(data.mean)
 mortality <- data.mortality[data.mortality$location%in%c(0,5) &
      data.mortality$age_cat%in%c(1,10) & data.mortality$sex%in%c(0,1),]
 mean <- data.mean[data.mean$location%in%c(0,5) &
      data.mean$age_cat%in%c(1,10) & data.mean$sex%in%c(0,1),]

# WARNING: The following code will take a long time to run
## No test: 
 fit = GPRMortality(mortality,mean,minYear =  1990,maxYear =  2015,
                    nu = 2,rho_ =0.4 ,product =  0.1 ,verbose=TRUE)
####### summary
 fit_sum = GPRMortalitySummary(fit)
 fit_sum
## End(No test)



