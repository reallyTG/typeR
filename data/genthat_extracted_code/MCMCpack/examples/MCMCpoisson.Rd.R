library(MCMCpack)


### Name: MCMCpoisson
### Title: Markov Chain Monte Carlo for Poisson Regression
### Aliases: MCMCpoisson
### Keywords: models

### ** Examples


   ## Not run: 
##D    counts <- c(18,17,15,20,10,20,25,13,12)
##D    outcome <- gl(3,1,9)
##D    treatment <- gl(3,3)
##D    posterior <- MCMCpoisson(counts ~ outcome + treatment)
##D    plot(posterior)
##D    summary(posterior)
##D    
## End(Not run)




