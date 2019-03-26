library(metamisc)


### Name: riley
### Title: Fit the alternative model for bivariate random-effects
###   meta-analysis
### Aliases: riley
### Keywords: bivariate meta-analysis multivariate regression riley

### ** Examples

data(Scheidler)
data(Daniels)
data(Kertai)

# Meta-analysis of potential surrogate markers data
# The results obtained by Riley (2008) were as follows:
# beta1 = -0.042 (SE = 0.063),
# beta2 = 14.072 (SE = 4.871)
# rho   = -0.759
## Not run: 
##D fit1 <- riley(Daniels) #maxit reached, try again with more iterations
## End(Not run)
fit1 <- riley(Daniels, control=list(maxit=10000))
summary(fit1)

# Meta-analysis of prognostic test studies
fit2 <- riley(Kertai)
fit2

# Meta-analysis of computed tomography data 
ds <- Scheidler[which(Scheidler$modality==1),]
fit3 <- riley(ds)
fit3




