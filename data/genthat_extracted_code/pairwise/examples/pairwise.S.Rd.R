library(pairwise)


### Name: pairwise.S
### Title: The Fischer-Scheiblechner Statistic S on item level (Wald like
###   Test)
### Aliases: pairwise.S

### ** Examples

##########
data("kft5")
S_ran_kft <- pairwise.S(daten = kft5,m = 2,split = "random")
summary(S_ran_kft)
summary(S_ran_kft,thres = FALSE)
#### polytomous examples
data(bfiN) # loading example data set
data(bfi_cov) # loading covariates to bfiN data set

# calculating itemparameters and SE for two subsamples by gender
S_gen <- pairwise.S(daten=bfiN, split = bfi_cov$gender)
summary(S_gen)
summary(S_gen,thres = FALSE)

# other splitting criteria
## Not run: 
##D S_med <- pairwise.S(daten=bfiN, split = "median")
##D summary(S_med)
##D 
##D S_ran<-pairwise.S(daten=bfiN, split = "random")
##D summary(S_ran)
##D 
##D S_ran.4<-pairwise.S(daten=bfiN, split = "random.4")
##D summary(S_ran.4) # currently not displayed
##D 
##D ###### example from details section 'Some Notes on Standard Errors' ########
##D S_def<-pairwise.S(daten=bfiN, split = "random",splitseed=13)
##D summary(S_def)
##D ######
##D S_400<-pairwise.S(daten=bfiN, split = "random", splitseed=13 ,nsample=400)
##D summary(S_400) 
## End(Not run)




