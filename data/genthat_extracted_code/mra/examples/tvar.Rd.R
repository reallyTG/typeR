library(mra)


### Name: tvar
### Title: Expand Time-varying covariates in models
### Aliases: tvar
### Keywords: models

### ** Examples


nan <- 30
ns <- 5
time.occ <- as.factor(paste("T",1:ns, sep=""))
attr(time.occ,"nan") <- nan
attr(time.occ,"drop.levels") <- ns

time.mat <- tvar(time.occ) # Last occasion is the reference, the SAS and MARK default.

time.mat <- tvar(as.factor(1:ns),nan,ns) #equivalent to above.

#   Look at 3-d matrix produced when called with factors
dim(time.mat) <- c(nan,ns,length(levels(time.occ))-1)
print(time.mat)  # each page is the 2-d matrix used in the fit.
print(time.mat[1,,])

#  compare above to 
tvar( 1:ns, nan )





