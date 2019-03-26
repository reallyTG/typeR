library(PSIMEX)


### Name: Psimex
### Title: Pedigree SIMEX
### Aliases: Psimex
### Keywords: ~pedigree ~SIMEX

### ** Examples

## Seed
set.seed(49494)

# extract data
data(pedigree)
data(data)
pedigree0 <- pedigree

# inbreeding depression case

# fixed error proportions 
lambda <- c(0.2, 0.3, 0.4, 0.5, 0.6)
# initial error proportion
lambda0 <- 0.1
# model used to compute inbreeding depression
model <- lm(y~sex+f_inb, data = data)

# PSIMEX 
results <- Psimex(pedigree0, data, 
                  lambda, lambda0, B = 100, 
                  model, parameter = "inbreeding", 
                  error = "missing", way = "uniform", 
                  fitting.method = c("quadratic", "linear"), 
                  ntop = NA, nbottom = NA, 
                  prior, nitt, thin, burnin)
results$description
results$error
results$fitting.method
results$way

results$extrapolated_data 
results$lambda
results$lambda0 
results$starting.value

## Not run: 
##D # heritability case
##D ## Seed
##D set.seed(49494)
##D 
##D # extract data
##D data(pedigree)
##D data(data)
##D pedigree0 <- pedigree
##D 
##D # fixed error proportions 
##D lambda <- c(0.2, 0.3, 0.4, 0.5, 0.6)
##D # initial error proportion
##D lambda0 <- 0.1
##D 
##D # model to compute heritability (MCMCglmm)
##D # prior specification
##D prior <- list(G=list(G1=list(V=matrix(1/3),n=1),
##D                      G2=list(V=matrix(1/3),n=1)),
##D               R=list(V=matrix(1/3),n=1))
##D 
##D #to fulfill MCMCglmm requirements
##D pedigree <- pedigree0[ , c(1,2,3)]
##D names(pedigree) <- c("animal", "dam", "sire")
##D ord <- orderPed(pedigree)
##D pedigree <- pedigree[order(ord),]
##D 
##D # model specification
##D model <- MCMCglmm(y~1+sex, random = ~animal+id, 
##D                   pedigree = pedigree, data = data, 
##D                   prior = prior, nitt = 20000, thin = 100, burnin = 1000, 
##D                   verbose = FALSE)
##D 
##D # PSIMEX
##D results1 <- Psimex(pedigree0, data, 
##D                    lambda, lambda0, B = 10, 
##D                    model, parameter = "heritability", 
##D                    error = "missing", way = "uniform", 
##D                    fitting.method = "quadratic", 
##D                    ntop = NA, nbottom = NA, 
##D                    prior = prior, nitt = 20000, thin = 100, burnin = 1000)
##D 
##D results1$description
##D results1$error
##D results1$fitting.method
##D results1$way
##D 
##D results1$extrapolated_data 
##D results1$lambda
##D results1$lambda0 
##D results1$starting.value
##D 
## End(Not run)



