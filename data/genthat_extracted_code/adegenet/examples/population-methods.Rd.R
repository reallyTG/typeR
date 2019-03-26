library(adegenet)


### Name: setPop
### Title: Manipulate the population factor of genind objects.
### Aliases: setPop setPop,genind-method setPop,genlight-method setPop<-
###   setPop<-,genind-method setPop<-,genlight-method

### ** Examples


data(microbov)

strata(microbov) <- data.frame(other(microbov))

# Currently set on just 
head(pop(microbov)) 

# setting the strata to both Pop and Subpop
setPop(microbov) <- ~coun/breed 
head(pop(microbov))

## Not run: 
##D 
##D # Can be used to create objects as well.
##D microbov.old <- setPop(microbov, ~spe) 
##D head(pop(microbov.old))
## End(Not run)



