library(BLCOP)


### Name: Distribution class constructors
### Title: Constructors for distribution and mvdistribution class objects
### Aliases: mvdistribution distribution
### Keywords: distribution

### ** Examples

    ## Not run: 
##D 	    # create a uniform distribution object and sample from it
##D 	    myUnif <- distribution("unif", min = -0.1, max = 0.1)
##D 	    hist(sampleFrom(myUnif, 1000))
##D 	    
##D 	    mvNormal <- mvdistribution("mnorm", mean = c(1, 5), varcov = diag(c(2, 0.1)))
##D 	    x <- sampleFrom(mvNormal, 1000)
##D 	    plot(x[,1] ~ x[,2])
##D     
## End(Not run)



