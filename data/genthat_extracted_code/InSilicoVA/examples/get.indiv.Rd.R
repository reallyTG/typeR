library(InSilicoVA)


### Name: get.indiv
### Title: Get individual COD probabilities from InSilicoVA Model Fits
### Aliases: get.indiv

### ** Examples

## Not run: 
##D data(RandomVA1)
##D fit1<- insilico(RandomVA1, subpop = NULL,
##D                 Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D                 auto.length = FALSE)
##D summary(fit1, id = "d199")
##D 
##D # Calculate aggregated COD distributions
##D agg.csmf <- get.indiv(data = RandomVA1, fit1, CI = 0.95, 
##D                      is.aggregate = TRUE, by = NULL)
##D head(agg.csmf) 
##D 
##D agg.by.sex.age <- get.indiv(data = RandomVA1, fit1, CI = 0.95, 
##D                             is.aggregate = TRUE, by = list("sex", "age"))
##D head(agg.by.sex.age$mean) 
## End(Not run)



