library(stepPenal)


### Name: tuneParam
### Title: Tune parameters w and lamda using the CL penalty
### Aliases: tuneParam

### ** Examples

## Not run: 
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -4)
##D noise   <- 5
##D simData <- SimData(N=100, beta=beta, noise=noise, corr=TRUE)
##D 
##D nfolds  <- 3
##D grid <- expand.grid(w = c( 0.3, 0.7),
##D                    lamda = c(1.5))
##D 
##D before <- Sys.time()
##D paramCV <- tuneParam(simData, nfolds, grid, algorithm=c("QN"))
##D (totalTime <- Sys.time() - before)
##D 
##D 
##D maxAUC    <- paramCV[which.max(paramCV$AUC),]$AUC
##D allmaxAUC <- paramCV[which(paramCV$AUC==maxAUC),] # checks if the value of AUC
##D # is unique; if is not unique then it will take the combination of lamda and
##D # w where lamda has the largest value- thus achieving higher sparsity
##D 
##D runQN   <- optimPenaLik(simData, lamda= allmaxAUC[nrow(allmaxAUC),]$lamda,
##D                          w= allmaxAUC[nrow(allmaxAUC),]$w,
##D                          algorithms=c("QN"))
##D (coefQN  <- runQN$varQN)
##D 
##D 
##D # check the robustness of the choice of lamda
##D 
##D runQN2   <- optimPenaLik(simData, lamda= allmaxAUC[1,]$lamda,
##D                          w= allmaxAUC[1,]$w,
##D                          algorithms=c("QN"))
##D (coefQN2  <- runQN2$varQN)
##D 
## End(Not run)



