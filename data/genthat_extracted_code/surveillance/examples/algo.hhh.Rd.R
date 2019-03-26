library(surveillance)


### Name: algo.hhh
### Title: Fit a Classical HHH Model (DEPRECATED)
### Aliases: algo.hhh print.ah coef.ah
### Keywords: ts regression

### ** Examples


# univariate time series: salmonella agona cases 
data(salmonella.agona)

model1 <- list(lambda=TRUE, linear=TRUE, 
               nseason=1, negbin="single")
               
algo.hhh(salmonella.agona, control=model1)

# multivariate time series: 
# measles cases in Lower Saxony, Germany
data(measles.weser)

# same model as above
algo.hhh(measles.weser, control=model1)

# include autoregressive parameter phi for adjacent "Kreise"
# specifiy start values for theta
model2 <- list(lambda = TRUE, neighbours = TRUE, 
               linear = FALSE, nseason = 1, 
               negbin = "single")
algo.hhh(measles.weser, control = model2, thetastart = rep(0, 20) )
                  
## weekly counts of influenza and meningococcal infections 
## in Germany, 2001-2006
data(influMen)

# specify model with two autoregressive parameters lambda_i, overdispersion
# parameters psi_i, an autoregressive parameter phi for meningococcal infections
# (i.e. nu_flu,t = lambda_flu * y_flu,t-1  
#  and  nu_men,t = lambda_men * y_men,t-1 + phi_men*y_flu,t-1 )
# and S=(3,1) Fourier frequencies
model <- list(lambda=c(TRUE,TRUE), neighbours=c(FALSE,TRUE),
              linear=FALSE,nseason=c(3,1),negbin="multiple")
              
# run algo.hhh
algo.hhh(influMen, control=model)

# now meningococcal infections in the same week should enter as covariates
# (i.e. nu_flu,t = lambda_flu * y_flu,t-1  
#  and  nu_men,t = lambda_men * y_men,t-1 + phi_men*y_flu,t )
model2 <- list(lambda=c(1,1), neighbours=c(NA,0),
              linear=FALSE,nseason=c(3,1),negbin="multiple")
              
algo.hhh(influMen, control=model2)





