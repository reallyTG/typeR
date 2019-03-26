library(mra)


### Name: ivar
### Title: Expand Individual-varying covariates in models
### Aliases: ivar
### Keywords: models

### ** Examples


nan <- 30
ns <- 5
age <- as.factor(sample( c("J","S1","S2","Adult"), size=nan, replace=TRUE ))
attr(age,"ns") <- ns

# Note that levels get reordered (by R default, alphabetically)
attr(age,"drop.levels") <- (1:length(levels(age)))[ levels(age) == "J" ]

age.mat <- ivar(age)  # level J is the reference
age.mat <- ivar(age, drop=4) # level S2 is the reference

# Look at 3-D matrix produced when called with a factor.
dim(age.mat) <- c(nan,ns,length(levels(age))-1)
print(age.mat)  # each page is the 2-d matrix used in the fit.
print(age.mat[1,,])

age.mat <- ivar(age, drop=c(3,4))  # level S1 and S2 are combined and are the reference

# compare above to 
ivar( c(1,1,2,2,3,3), 5 )




