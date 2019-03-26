library(eco)


### Name: ecoML
### Title: Fitting Parametric Models and Quantifying Missing Information
###   for Ecological Inference in 2x2 Tables
### Aliases: ecoML
### Keywords: models

### ** Examples



## load the census data
data(census)

## NOTE: convergence has not been properly assessed for the following
## examples. See Imai, Lu and Strauss (2006) for more complete analyses.
## In the first example below, in the interest of time, only part of the
## data set is analyzed and the convergence requirement is less stringent
## than the default setting.

## In the second example, the program is arbitrarily halted 100 iterations
## into the simulation, before convergence.

## load the Robinson's census data
data(census)

## fit the parametric model with the default model specifications
## Not run: 
##D res <- ecoML(Y ~ X, data = census[1:100,], N=census[1:100,3], 
##D 	     	  epsilon=10^(-6), verbose = TRUE)
## End(Not run)
## summarize the results
## Not run: summary(res)

## obtain out-of-sample prediction
## Not run: out <- predict(res, verbose = TRUE)
## summarize the results
## Not run: summary(out)

## fit the parametric model with some individual 
## level data using the default prior specification
surv <- 1:600
## Not run: 
##D res1 <- ecoML(Y ~ X, context = TRUE, data = census[-surv,], 
##D                    supplement = census[surv,c(4:5,1)], maxit=100, verbose = TRUE)
## End(Not run)
## summarize the results
## Not run: summary(res1)





