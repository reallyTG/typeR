library(adegenet)


### Name: strata
### Title: Access and manipulate the population strata for genind or
###   genlight objects.
### Aliases: strata strata,genind-method strata,genlight-method strata<-
###   strata<-,genind-method strata<-,genlight-method nameStrata
###   nameStrata,genind-method nameStrata,genlight-method nameStrata<-
###   nameStrata<-,genind-method nameStrata<-,genlight-method splitStrata
###   splitStrata,genind-method splitStrata,genlight-method splitStrata<-
###   splitStrata<-,genind-method splitStrata<-,genlight-method addStrata
###   addStrata,genind-method addStrata,genlight-method addStrata<-
###   addStrata<-,genind-method addStrata<-,genlight-method

### ** Examples

# let's look at the microbov data set:
data(microbov)
microbov

# We see that we have three vectors of different names in the 'other' slot. 
# ?microbov
# These are Country, Breed, and Species
names(other(microbov))

# Let's set the strata
strata(microbov) <- data.frame(other(microbov))
microbov

# And change the names so we know what they are
nameStrata(microbov) <- ~Country/Breed/Species

## Not run: 
##D # let's see what the strata looks like by Species and Breed:
##D head(strata(microbov, ~Breed/Species))
##D 
##D # If we didn't want the last column combined with the first, we can set
##D # combine = FALSE
##D head(strata(microbov, ~Breed/Species, combine = FALSE))
##D 
##D #### USING splitStrata ####
##D 
##D # For the sake of example, we'll imagine that we have imported our data set
##D # with all of the stratifications combined. 
##D setPop(microbov) <- ~Country/Breed/Species
##D strata(microbov) <- NULL
##D 
##D # This is what our data would look like after import.
##D microbov
##D 
##D # To set our strata here, we need to use the functions strata and splitStrata
##D strata(microbov) <- data.frame(x = pop(microbov))
##D microbov # shows us that we have "one" level of stratification
##D head(strata(microbov)) # all strata are separated by "_"
##D 
##D splitStrata(microbov) <- ~Country/Breed/Species
##D microbov # Now we have all of our strata named and split
##D head(strata(microbov)) # all strata are appropriately named and split.
## End(Not run)



