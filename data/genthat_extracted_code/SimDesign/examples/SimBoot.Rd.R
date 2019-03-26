library(SimDesign)


### Name: SimBoot
### Title: Function to present bootstrap standard errors estimates for
###   Monte Carlo simulation meta-statistics
### Aliases: SimBoot

### ** Examples


## Not run: 
##D #SimFunctions()
##D 
##D Design <- data.frame(N = c(10, 20, 30))
##D 
##D Generate <- function(condition, fixed_objects = NULL){
##D     dat <- with(condition, rnorm(N, 10, 5)) # distributed N(10, 5)
##D     dat
##D }
##D 
##D Analyse <- function(condition, dat, fixed_objects = NULL){
##D     CIs <- t.test(dat)$conf.int # t-based CIs
##D     xbar <- mean(dat) # mean of the sample data vector
##D     ret <- c(mean=xbar, lowerCI=CIs[1], upperCI=CIs[2])
##D     ret
##D }
##D 
##D Summarise <- function(condition, results, fixed_objects = NULL){
##D     ret <- c(mu=mean(results[,1]), SE=sd(results[,1]), # mean and SD summary of the sample means
##D              coverage=ECR(results[,2:3], parameter = 10))
##D     ret
##D }
##D 
##D res <- runSimulation(design=Design, replications=250, bootSE=TRUE,
##D                        generate=Generate, analyse=Analyse, summarise=Summarise)
##D 
##D res
##D SimBoot(res)
##D 
##D # larger R
##D res2 <- runSimulation(design=Design, replications=2500, bootSE=TRUE,
##D                        generate=Generate, analyse=Analyse, summarise=Summarise)
##D 
##D # point estimates more accurate, smaller BOOT_SE terms
##D res2
##D SimBoot(res2) # more reasonable CI range
##D 
## End(Not run)




