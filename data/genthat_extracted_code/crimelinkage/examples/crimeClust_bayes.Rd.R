library(crimelinkage)


### Name: crimeClust_bayes
### Title: Bayesian model-based partially-supervised clustering for crime
###   series identification
### Aliases: crimeClust_bayes

### ** Examples

# Toy dataset with 12 crimes and three criminals.

 # Make IDs: Criminal 1 committed crimes 1-4, etc.
 id <- c(1,1,1,1,
         2,2,2,2,
                 3,3,3,3)

 # spatial locations of the crimes:
 s <- c(0.8,0.9,1.1,1.2,
        1.8,1.9,2.1,2.2,
        2.8,2.9,3.1,3.2)
 s <- cbind(0,s)

 # Categorical crime features, say mode of entry (1=door, 2=other) and
 # type of residence (1=apartment, 2=other)
 Mode <- c(1,1,1,1,  #Different distribution by criminal
           1,2,1,2,
           2,2,2,2)
 Type <- c(1,2,1,2,  #Same distribution for all criminals
           1,2,1,2,
           1,2,1,2)
 Xcat <- cbind(Mode,Type)

 # Times of the crimes
 t <- c(1,2,3,4,
        2,3,4,5,
        3,4,5,6)

 # Now let's pretend we don't know the criminal for crimes 1, 4, 6, 8, and 12.
 id <- c(NA,1,1,NA,2,NA,2,NA,3,3,3,NA)

 # Fit the model (nb: use much larger iters and burn on real problem)
 fit <- crimeClust_bayes(crimeID=id, spatial=s, t1=t,t2=t, Xcat=Xcat,
                   maxcriminals=12,iters=500,burn=100,update=100)

 # Plot the posterior probability matrix that each pair of crimes was
 # committed by the same criminal:
 if(require(fields,quietly=TRUE)){
 fields::image.plot(1:12,1:12,fit$p.equal,
            xlab="Crime",ylab="Crime",
            main="Probability crimes are from the same criminal")
 }

 # Extract the crimes with the largest posterior probability
 bayesPairs(fit$p.equal)
 bayesProb(fit$p.equal[1,])



