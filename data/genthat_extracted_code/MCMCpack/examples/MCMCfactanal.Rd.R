library(MCMCpack)


### Name: MCMCfactanal
### Title: Markov Chain Monte Carlo for Normal Theory Factor Analysis Model
### Aliases: MCMCfactanal
### Keywords: models

### ** Examples


   ## Not run: 
##D    ### An example using the formula interface
##D    data(swiss)
##D    posterior <- MCMCfactanal(~Agriculture+Examination+Education+Catholic
##D                     +Infant.Mortality, factors=2,
##D                     lambda.constraints=list(Examination=list(1,"+"),
##D                        Examination=list(2,"-"), Education=c(2,0),
##D                        Infant.Mortality=c(1,0)),
##D                     verbose=0, store.scores=FALSE, a0=1, b0=0.15,
##D                     data=swiss, burnin=5000, mcmc=50000, thin=20)
##D    plot(posterior)
##D    summary(posterior)
##D 
##D    ### An example using the matrix interface
##D    Y <- cbind(swiss$Agriculture, swiss$Examination,
##D               swiss$Education, swiss$Catholic,
##D               swiss$Infant.Mortality)
##D    colnames(Y) <- c("Agriculture", "Examination", "Education", "Catholic",
##D                     "Infant.Mortality")
##D    post <- MCMCfactanal(Y, factors=2,
##D                         lambda.constraints=list(Examination=list(1,"+"),
##D                           Examination=list(2,"-"), Education=c(2,0),
##D                           Infant.Mortality=c(1,0)),
##D                         verbose=0, store.scores=FALSE, a0=1, b0=0.15,
##D                         burnin=5000, mcmc=50000, thin=20)
##D    
## End(Not run)




