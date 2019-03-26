library(adegenet)


### Name: hier
### Title: Access and manipulate the population hierarchy for genind or
###   genlight objects.
### Aliases: hier hier,genind-method hier,genlight-method hier<-
###   hier<-,genind-method hier<-,genlight-method

### ** Examples

# let's look at the microbov data set:
data(microbov)
microbov

# We see that we have three vectors of different names in the 'other' slot. 
?microbov
# These are Country, Breed, and Species
names(other(microbov))

# Let's set the hierarchy
strata(microbov) <- data.frame(other(microbov))
microbov

# And change the names so we know what they are
nameStrata(microbov) <- ~Country/Breed/Species

# let's see what the hierarchy looks like by Species and Breed:
hier(microbov) <- ~Species/Breed
head(hier(microbov, ~Species/Breed))




