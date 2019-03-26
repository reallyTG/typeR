library(OxyBS)


### Name: fitOxBS
### Title: Fit OxyBS for one specimen
### Aliases: fitOxBS

### ** Examples

## Not run: 
##D data(OxyBSSampleData)
##D 
##D nSpecimens <- 30
##D nCpGs <- 30
##D 
##D # Calculate Total Signals
##D signalBS <- exampleMethBS+exampleUnmethBS
##D signalOxBS <- exampleMethOxBS+exampleUnmethOxBS
##D 
##D # Calculate Beta Values
##D betaBS <- exampleMethBS/signalBS
##D betaOxBS <- exampleMethOxBS/signalOxBS
##D 
##D # Create container for results
##D MethOxy <- array(NA,dim=c(nCpGs,nSpecimens,3))
##D dimnames(MethOxy) <- list(
##D   rownames(exampleMethBS)[1:nCpGs],
##D   colnames(exampleMethBS)[1:nSpecimens],
##D   c("C","5mC","5hmC"))
##D 
##D # Process results (one array at a time)
##D for(i in 1:nSpecimens){
##D   MethOxy[,i,] <- fitOxBS(betaBS[,i],betaOxBS[,i],signalBS[,i],signalOxBS[,i])
##D }
##D 
##D # Check that results sum to one
##D table(apply(MethOxy,1:2,sum))
##D 
##D # First specimen
##D MethOxy[,1,]
##D 
##D # Ranges
##D range(MethOxy[,,1])
##D range(MethOxy[,,2])
##D range(MethOxy[,,3])
## End(Not run)


