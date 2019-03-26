library(DoseFinding)


### Name: powMCT
### Title: Calculate power for multiple contrast test
### Aliases: powMCT

### ** Examples

## look at power under some dose-response alternatives
## first the candidate models used for the contrasts
doses <- c(0,10,25,50,100,150)
## define models to use as alternative 
fmodels <- Mods(linear = NULL, emax = 25,
                logistic = c(50, 10.88111), exponential= 85,
                betaMod=rbind(c(0.33,2.31),c(1.39,1.39)),
                doses = doses, addArgs=list(scal = 200),
                placEff = 0, maxEff = 0.4)
## plot alternatives
plot(fmodels)
## power for to detect a trend
contMat <- optContr(fmodels, w = 1)
powMCT(contMat, altModels = fmodels, n = 50, alpha = 0.05, sigma = 1)

## Not run: 
##D ## power under the Dunnett test
##D ## contrast matrix for Dunnett test with informative names
##D contMatD <- rbind(-1, diag(5))
##D rownames(contMatD) <- doses
##D colnames(contMatD) <- paste("D", doses[-1], sep="")
##D powMCT(contMatD, altModels = fmodels, n = 50, alpha = 0.05, sigma = 1)
##D 
##D ## now investigate power of the contrasts in contMat under "general" alternatives
##D altFmods <- Mods(linInt = rbind(c(0, 1, 1, 1, 1),
##D                                   c(0.5, 1, 1, 1, 0.5)),
##D                  doses=doses, placEff=0, maxEff=0.5)
##D plot(altFmods)
##D powMCT(contMat, altModels = altFmods, n = 50, alpha = 0.05, sigma = 1)
##D 
##D ## now the first example but assume information only on the
##D ## placebo-adjusted scale
##D ## for balanced allocations and 50 patients with sigma = 1 one obtains
##D ## the following covariance matrix
##D S <- 1^2/50*diag(6)
##D ## now calculate variance of placebo adjusted estimates
##D CC <- cbind(-1,diag(5))
##D V <- (CC)%*%S%*%t(CC)
##D linMat <- optContr(fmodels, doses = c(10,25,50,100,150),
##D                    S = V, placAdj = TRUE)
##D powMCT(linMat, altModels = fmodels, placAdj=TRUE,
##D        alpha = 0.05, S = V, df=6*50-6) # match df with the df above
## End(Not run)



