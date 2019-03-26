library(EcoSimR)


### Name: ranMatGen
### Title: Random Matrix Generator
### Aliases: ranMatGen

### ** Examples

## Not run: 
##D ## Create a null matrix similar to MacArthur's warblers
##D testMatrix <- ranMatGen(aBetaCol=1000,bBetaCol=1000,
##D                         aBetaRow=1,bBetaRow=1,
##D                         numRows=5,numCols=16,
##D                         mFill=0.75, abun=1000,
##D                         emptyRow=FALSE,emptyCol=TRUE)$m
##D 
##D ## Run the null model
##D testMod <- niche_null_model(testMatrix)
##D 
##D ## Summary and niche utilization plot
##D summary(testAnalysis)
##D plot(testMod,type="niche")
##D 
##D 
##D ## Create a null matrix similar to West Indies Finches
##D testMatrix <- ranMatGen(aBetaCol=0.5,bBetaCol=0.5,
##D                         aBetaRow=0.5,bBetaRow=0.5,
##D                         numRows=30,numCols=30,
##D                         mFill=0.25,abun=0,emptyRow=FALSE,
##D                         emptyCol=FALSE)$m
##D 
##D ## Run the null model
##D testMod <- cooc_null_model(testMatrix$m,
##D                            algo="simFast",
##D                            burnin=10000,n.reps=1000)
##D 
##D ## Summary and matrix, burn-in plots
##D summary(testMod)
##D plot(testMod,type="cooc")
##D plot(testMod,type="burnin")
## End(Not run)



