library(pairwise)


### Name: grm
### Title: Graphical Model Check
### Aliases: grm

### ** Examples

data(bfiN) # loading example data set

data(bfi_cov) # loading covariates to bfiN data set

# calculating itemparameters and SE for two random allocated subsamples
grm_gen <- grm(daten=bfiN, split = bfi_cov$gender)
summary(grm_gen)
plot(grm_gen)

grm_med <- grm(daten=bfiN, split = "median")
summary(grm_med)
plot(grm_med)

grm_ran<-grm(daten=bfiN, split = "random") 

summary(grm_ran)

# some examples for plotting options
# plotting item difficulties for two subsamples against each other 
# with elipses for a CI = 95% .
plot(grm_ran) 

# using triangles as plotting pattern
plot(grm_ran,pch=2) 

#plotting without CI ellipses
plot(grm_ran,ci=0,pch=2) 

# plotting with item names
plot(grm_ran,itemNames=TRUE) 

# Changing the size of the item names
plot(grm_ran,itemNames=TRUE, cex.names = 1.3)

# Changing the color of the CI ellipses
plot(grm_ran,itemNames=TRUE, cex.names = .8, col.error="green")

###### example from details section 'Some Notes on Standard Errors' ########
## Not run: 
##D grm_def<-grm(daten=bfiN, split = "random",splitseed=13)
##D plot(grm_def)
##D ######
##D grm_400<-grm(daten=bfiN, split = "random", splitseed=13 ,nsample=400)
##D plot(grm_400)
## End(Not run) 





