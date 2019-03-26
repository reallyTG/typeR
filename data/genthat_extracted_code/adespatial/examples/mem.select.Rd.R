library(adespatial)


### Name: mem.select
### Title: Selection of the best subset of spatial eigenvectors (MEM,
###   Moran's Eigenvector Maps)
### Aliases: mem.select
### Keywords: spatial

### ** Examples

if(require(vegan)){ 
# Illustration of the MIR selection on the oribatid mite data
# (Borcard et al. 1992, 1994 for details on the dataset):
# *******************************************************
# Community data (response matrix):
data(mite)
# We will compute the example on a single species:
spe <- mite[, 2]
# Environmental explanatory dataset:
data(mite.env)
# We only use two numerical explanatory variables:
env <- mite.env[, 1:2]
dim(env)
# Coordinates of the 70 sites:
data(mite.xy)
coord <- mite.xy
# We build the model we are interested in:
mod <- lm(spe ~ ., data = env)


# In order to avoid possible type I error rate inflation issues, we check 
# whether the model residuals are independent, and if they are spatially
# autocorrelated, we select a small subset of MEM variables to add to the
# model as covariables with the MIR selection:

# 1) We build a spatial weighting matrix based on Gabriel graph with a
# weighting function decreasing linearly with the distance:
w <- listw.candidates(coord, nb = "gab", weights = "flin")


# 2) We test the spatial autocorrelation of the model residuals and, if
# necessary, select a subset of spatial predictors:
y <- residuals(mod)
MEM <- mem.select(x = y, listw = w[[1]], method = "MIR", MEM.autocor = "positive",
         nperm = 999, alpha = 0.05)
dim(MEM$MEM.select)
# The residuals of the model presented spatial autocorrelation. The selection
# of MEM variables is thus performed to remove residual autocorrelation.

# 3) We can reconstruct our model adding the selected MEM variable as covariables:
env2 <- cbind(env, MEM$MEM.select)
mod_complete <- lm(spe ~ ., data = env2)
summary(mod_complete)$coefficient[, 1]   # Coefficient estimates
summary(mod_complete)$coefficient[, 2]   # Standard errors
}





