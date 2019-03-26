library(DoseFinding)


### Name: optContr
### Title: Calculate optimal contrasts
### Aliases: optContr plot.optContr

### ** Examples

doses <- c(0,10,25,50,100,150)
models <- Mods(linear = NULL, emax = 25,
               logistic = c(50, 10.88111), exponential= 85,
               betaMod=rbind(c(0.33,2.31), c(1.39,1.39)),
               doses = doses, addArgs = list(scal = 200))
contMat <- optContr(models, w = rep(50,6))
plot(contMat)

## now we would like the "contrasts" for placebo adjusted estimates
dosPlac <- doses[-1]
## matrix proportional to cov-matrix of plac. adj. estimates for balanced data
S <- diag(5)+matrix(1, 5,5)
## note that we explicitly hand over the doses here
contMat0 <- optContr(models, doses=dosPlac, S = S, placAdj = TRUE)
## -> contMat0 is no longer a contrast matrix (columns do not sum to 0)
colSums(contMat0$contMat)
## calculate contrast matrix for unadjusted estimates from this matrix
## (should be same as above)
aux <- rbind(-colSums(contMat0$contMat), contMat0$contMat)
t(t(aux)/sqrt(colSums(aux^2))) ## compare to contMat$contMat

## now calculate constrained contrasts 
optContr(models, w = rep(50,6), type = "constrained")
optContr(models, doses=dosPlac, S = S, placAdj = TRUE,
         type = "constrained")



