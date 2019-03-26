library(nimble)


### Name: nimbleRcall
### Title: Make an R function callable from compiled nimbleFunctions
###   (including nimbleModels).
### Aliases: nimbleRcall

### ** Examples

## Not run: 
##D ## Say we want an R function that adds 2 to every value in a vector
##D add2 <- function(x) {
##D    x + 2 
##D }
##D Radd2 <- nimbleRcall(function(x = double(1)){}, Rfun = 'add2',
##D returnType = double(1), envir = .GlobalEnv)
##D demoCode <- nimbleCode({
##D     for(i in 1:4) {x[i] ~ dnorm(0,1)} 
##D     z[1:4] <- Radd2(x[1:4])
##D })
##D demoModel <- nimbleModel(demoCode, inits = list(x = rnorm(4)),
##D check = FALSE, calculate = FALSE)
##D CdemoModel <- compileNimble(demoModel)
## End(Not run)



