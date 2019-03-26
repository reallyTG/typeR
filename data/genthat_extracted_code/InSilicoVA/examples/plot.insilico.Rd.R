library(InSilicoVA)


### Name: plot.insilico
### Title: plot CSMF from a "insilico" object
### Aliases: plot.insilico
### Keywords: InSilicoVA

### ** Examples


## Not run: 
##D data(RandomVA1) 
##D ##
##D ## Scenario 1: without sub-population specification
##D ##
##D fit1<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               auto.length = FALSE)
##D # basic line plot
##D plot(fit1)
##D # basic bar plot
##D plot(fit1, type = "bar")
##D # line plot with customized look
##D plot(fit1, top = 15, horiz = FALSE, fill = "gold", 
##D            bw = TRUE, title = "Top 15 CSMFs", angle = 70, 
##D            err_width = .2, err_size = .6, point_size = 2)
##D 
##D ##
##D ## Scenario 2: with sub-population specification
##D ##
##D data(RandomVA2)
##D fit2<- insilico(RandomVA2, subpop = list("sex"),  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               auto.length = FALSE)
##D summary(fit2)
##D # basic side-by-side line plot for all sub-populations
##D plot(fit2, type = "compare", main = "Top 5 causes comparison")
##D # basic line plot for specific sub-population
##D plot(fit2, which.sub = "Women", main = "Top 5 causes for women")
##D # customized plot with only specified causes
##D # the cause names need not be exact as InterVA cause list
##D # substrings in InterVA cause list is enough for specification
##D # e.g. the following two specifications are the same
##D some_causes_1 <- c("HIV/AIDS related death", "Pulmonary tuberculosis")
##D some_causes_2 <- c("HIV", "Pulmonary")
##D plot(fit2, type = "compare", horiz = FALSE,  causelist = some_causes_1,
##D               title = "HIV and TB fractions in two sub-populations", 
##D               angle = 20)
## End(Not run)




