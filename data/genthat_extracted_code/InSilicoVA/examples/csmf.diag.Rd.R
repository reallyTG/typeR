library(InSilicoVA)


### Name: csmf.diag
### Title: Convergence test for fitted InSilico model
### Aliases: csmf.diag
### Keywords: InSilicoVA

### ** Examples


# load sample data together with sub-population list
data(RandomVA2)
## No test: 
# extract InterVA style input data
data <- RandomVA2
# extract sub-population information. 
subpop <- RandomVA2$sex

# run without sub-population
fit1a<- insilico( data, subpop = NULL, 
              Nsim = 400, burnin = 200, thin = 10 , seed = 1, 
              auto.length = FALSE)
fit1b<- insilico( data, subpop = NULL,  
              Nsim = 400, burnin = 200, thin = 10 , seed = 2, 
              auto.length = FALSE)
fit1c<- insilico( data, subpop = NULL,  
              Nsim = 400, burnin = 200, thin = 10 , seed = 3, 
              auto.length = FALSE)
# single chain check
csmf.diag(fit1a)

# multiple chains check
csmf.diag(list(fit1a, fit1b, fit1c), test = "gelman")


# with sub-populations
fit2a<- insilico( data, subpop = subpop,  
              Nsim = 400, burnin = 200, thin = 10 , seed = 1, 
              auto.length = FALSE)
fit2b<- insilico( data, subpop = subpop,  
              Nsim = 400, burnin = 200, thin = 10 , seed = 2, 
              auto.length = FALSE)
fit2c<- insilico( data, subpop = subpop,   
              Nsim = 400, burnin = 200, thin = 10 , seed = 3, 
              auto.length = FALSE)
# single chain check
csmf.diag(fit2a)

# multiple chains check
csmf.diag(list(fit2a, fit2b, fit2c), test = "gelman", which.sub = "Men")
## End(No test)





