library(InSilicoVA)


### Name: indivplot
### Title: plot aggregated COD distribution
### Aliases: indivplot
### Keywords: InSilicoVA

### ** Examples


## Not run: 
##D # Toy example with 1000 VA deaths
##D data(RandomVA1)
##D fit1<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               auto.length = FALSE)
##D summary(fit1, id = "d199")
##D 
##D # update credible interval for individual probabilities to 90%
##D indiv.new <- get.indiv(fit1, CI = 0.9)
##D fit1$indiv.prob.lower <- indiv.new$lower
##D fit1$indiv.prob.upper <- indiv.new$upper
##D fit1$indiv.CI <- 0.9
##D summary(fit1, id = "d199")
##D 
##D 
##D # get empirical aggregated COD distribution 
##D agg.csmf <- get.indiv(data = RandomVA2, fit1, CI = 0.95, 
##D                       is.aggregate = TRUE, by = NULL)
##D head(agg.csmf)
##D 
##D # aggregate individual COD distribution by sex and age
##D # note the model was fitted assuming the same CSMF for all deaths
##D # this aggregation provides an approximate CSMF for each sub-groups
##D agg.by.sex.age <- get.indiv(data = RandomVA2, fit1, CI = 0.95, 
##D                         is.aggregate = TRUE, by = list("sex", "age"))
##D head(agg.by.sex.age$mean)
##D 
##D # plot of aggregated individual COD distribution
##D # 0. plot for all data
##D indivplot(agg.csmf, top = 10)
##D # 1. plot for specific one group
##D indivplot(agg.by.sex.age, which.plot = "Men 60-", top = 10)
##D # 2. comparing multiple groups
##D indivplot(agg.by.sex.age, which.plot = list("Men 60+", "Men 60-"), 
##D                           top = 5)
##D # 3. comparing multiple groups on selected causes
##D indivplot(agg.by.sex.age, which.plot = list("Men 60-", "Women 60-"), 
##D                           top = 0, causelist = c(
##D                             "HIV/AIDS related death", 
##D                             "Pulmonary tuberculosis", 
##D                             "Other and unspecified infect dis", 
##D                             "Other and unspecified NCD"))
## End(Not run) 



