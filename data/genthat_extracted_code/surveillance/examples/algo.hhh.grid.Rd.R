library(surveillance)


### Name: algo.hhh.grid
### Title: Fit a Classical HHH Model (DEPRECATED) with Varying Start Values
### Aliases: algo.hhh.grid print.ahg coef.ahg
### Keywords: ts regression

### ** Examples

## monthly counts of menigococcal infections in France
data(meningo.age)
            
# specify model for algo.hhh.grid
model1 <- list(lambda=TRUE)

# create grid of inital values
grid1 <- create.grid(meningo.age, model1, 
                     params = list(epidemic=c(0.1,0.9,5)))
                     
# try multiple starting values, print progress information
algo.hhh.grid(meningo.age, control=model1, thetastartMatrix=grid1,
              verbose=interactive())


## more sophisticated models with a much longer runtime follow
## Not run: 
##D # specify model
##D model2 <- list(lambda=TRUE, neighbours=TRUE, negbin="single",
##D                nseason=1)
##D grid2 <- create.grid(meningo.age, model2, 
##D                      params = list(epidemic=c(0.1,0.9,3), 
##D                                    endemic=c(-0.5,0.5,3), 
##D                                    negbin = c(0.3, 12, 10)))
##D                                  
##D # run algo.hhh.grid, search time is limited to 30 sec
##D algo.hhh.grid(meningo.age, control=model2, thetastartMatrix=grid2,
##D               maxTime=30)
##D               
##D ## weekly counts of influenza and meningococcal infections in Germany, 2001-2006
##D data(influMen)
##D 
##D # specify model with two autoregressive parameters lambda_i, overdispersion
##D # parameters psi_i, an autoregressive parameter phi for meningococcal infections
##D # (i.e. nu_flu,t = lambda_flu * y_flu,t-1  
##D #  and  nu_men,t = lambda_men * y_men,t-1 + phi_men*y_flu,t-1 )
##D # and S=(3,1) Fourier frequencies
##D model <- list(lambda=c(TRUE,TRUE), neighbours=c(FALSE,TRUE),
##D               linear=FALSE, nseason=c(3,1),negbin="multiple")
##D               
##D # create grid of initial values
##D grid <- create.grid(influMen,model, list(epidemic=c(.1,.9,3),
##D               endemic=c(-.5,.5,3), negbin=c(.3,15,10)))
##D # run algo.hhh.grid, search time is limited to 30 sec
##D algo.hhh.grid(influMen, control=model, thetastartMatrix=grid, maxTime=30)
##D 
##D # now meningococcal infections in the same week should enter as covariates
##D # (i.e. nu_flu,t = lambda_flu * y_flu,t-1  
##D #  and  nu_men,t = lambda_men * y_men,t-1 + phi_men*y_flu,t )
##D model2 <- list(lambda=c(1,1), neighbours=c(NA,0),
##D               linear=FALSE,nseason=c(3,1),negbin="multiple")
##D               
##D algo.hhh.grid(influMen, control=model2, thetastartMatrix=grid, maxTime=30)
## End(Not run)



