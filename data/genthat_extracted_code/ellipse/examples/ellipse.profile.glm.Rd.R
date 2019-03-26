library(ellipse)


### Name: ellipse.profile.glm
### Title: Pairwise profile sketch for GLM profiles
### Aliases: ellipse.profile.glm
### Keywords: dplot models

### ** Examples

## MASS has a pairs.profile function that conflicts with ours, so
## do a little trickery here
	 noMASS <- is.na(match('package:MASS', search()))
	 if (noMASS) require(MASS)

## Dobson (1990) Page 93: Randomized Controlled Trial :

     counts <- c(18,17,15,20,10,20,25,13,12)
     outcome <- gl(3,1,9)
     treatment <- gl(3,3)
     glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())

##  Plot an approximate 95% confidence region for the two outcome variables
     prof.D93 <- profile(glm.D93)
     plot(ellipse(prof.D93, which = 2:3), type = 'l')
     lines(ellipse(glm.D93, which = 2:3), lty = 2)
     params <- glm.D93$coefficients
     points(params[2],params[3])
     
##  Clean up our trickery
	 if (noMASS) detach('package:MASS')
	 



