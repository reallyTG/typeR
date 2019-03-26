library(KENDL)


### Name: KRKM
### Title: Calculate the exposure distribution in the presence of detection
###   limits
### Aliases: KRKM

### ** Examples

# simulated data set from a lognormal regression model
 lod <- exp(rnorm(200, -2.79, 1.12))
 e   <- rnorm(200, 0 , 1.21 )
 t   <- exp(-3.05+0.42*lod+e)
 obs <- pmax(t, lod)
 bdl <- t<lod
# KRKM estimator 
 fit <- KRKM(obs=obs, bdl=bdl, lod=lod)



