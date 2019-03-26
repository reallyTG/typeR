library(mra)


### Name: F.huggins.estim
### Title: F.huggins.estim - Estimation of Huggins closed population
###   capture-recapture model.
### Aliases: F.huggins.estim huggins.estim huggins Huggins
### Keywords: survival models

### ** Examples


# Fake the data for these examples
set.seed(3425)
ch.mat <- matrix( round(runif(30*5)), nrow=30, ncol=5)
ch.mat <- ch.mat[ apply(ch.mat,1,sum) > 0, ]  # no zero rows allowed
ct <- as.factor(1:ncol(ch.mat))
attr(ct,"nan") <- nrow(ch.mat)   # used to fit time varying factor
sex <- round(runif(nrow(ch.mat)))   # fake sex 
attr(sex,"ns") <- ncol(ch.mat)

# Models parallel to the 8 Otis et al. models.
# see Amstrup et al. (2005, p. 77)

# Constant model (model M(0)).
hug.0 <- F.huggins.estim( ~1, NULL, ch.mat )

# Time varying model (model M(t))
hug.t <- F.huggins.estim( ~tvar(ct), NULL, ch.mat)

# Additive Behavioral model (model M(b))
hug.b <- F.huggins.estim( ~1, ~1, ch.mat )

# Time and Behavioral model (model M(tb))
hug.tb <- F.huggins.estim( ~tvar(ct), ~1, ch.mat )

# Individual effects (model M(h))
hug.h <- F.huggins.estim( ~ivar(sex), NULL, ch.mat )

# Individual and Behavioral effects (model M(bh))
hug.bh <- F.huggins.estim( ~ivar(sex), ~1, ch.mat )

# Individual and time effects (model M(th))
hug.th <- F.huggins.estim( ~ivar(sex)+tvar(ct), NULL, ch.mat )

# Individual, time, and behavoral effects (model M(tbh))
hug.tbh <- F.huggins.estim( ~ivar(sex)+tvar(ct), ~1, ch.mat )

# Time varying initial captures, recaptures are constant and depend on sex.
hug.custom1 <- F.huggins.estim( ~tvar(ct), ~ivar(sex), ch.mat, remove=TRUE )

# Compare hug.custom1 to the following: Time varying initial captures with 
# time varying recaptures that depend on sex.
hug.custom2 <- F.huggins.estim( ~tvar(ct), ~ivar(sex), ch.mat, remove=FALSE )

# Values in first column of recapture covariates do not matter. 
# Below, mod.1 and mod.2 are identical.
mod.1 <- F.huggins.estim( ~tvar(ct), ~tvar( c( 0,1,2,3,4), nrow(ch.mat)), ch.mat, remove=TRUE)
mod.2 <- F.huggins.estim( ~tvar(ct), ~tvar( c(-9,1,2,3,4), nrow(ch.mat)), ch.mat, remove=TRUE)







