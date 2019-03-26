library(IMIFA)


### Name: MGP_check
### Title: Check the validity of Multiplicative Gamma Process (MGP)
###   hyperparameters
### Aliases: MGP_check
### Keywords: control

### ** Examples

# Check if expected shrinkage under the MGP increases with the column index (WRONG approach!).
MGP_check(ad1=1.5, ad2=1.8, Q=10, phi.shape=3, inverse=FALSE)$valid      #TRUE

# Check if the induced IG prior on the MGP column shrinkage parameters
# is stochastically increasing, thereby inducing cumulative shrinkage     (CORRECT approach!).
MGP_check(ad1=1.5, ad2=1.8, Q=10, phi.shape=3, inverse=TRUE)$valid       #FALSE

# Check again with a parameterisation that IS valid and examine the expected shrinkage values.
(shrink <- MGP_check(ad1=1.5, ad2=2.8, Q=10, phi.shape=2, phi.rate=0.5, inverse=TRUE))



