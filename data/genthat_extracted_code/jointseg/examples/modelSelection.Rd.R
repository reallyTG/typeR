library(jointseg)


### Name: modelSelection
### Title: Model selection
### Aliases: modelSelection

### ** Examples


## load known real copy number regions
affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)
sim <- getCopyNumberDataByResampling(1e4, 5, minLength=100, regData=affyDat)
Y <- as.matrix(sim$profile[, "c"])

## Find candidate breakpoints
K <- 50
resRBS <- segmentByRBS(Y, K=K)
## Prune candidate breakpoints
resDP <- pruneByDP(Y, candCP=resRBS$bkp)
selectedModel <- modelSelection(rse=resDP$rse, n=nrow(Y), method="Lebarbier")
str(selectedModel)

## breakpoints of the best model
bestBkp <- resDP$bkp[[selectedModel$kbest]]
print(bestBkp)

## truth
print(sim$bkp)

## Note that all of the above can be done directly using 'PSSeg'
res <- PSSeg(sim$profile, method="RBS", stat="c", K=K)
##  stopifnot(identical(res$bestBkp, bestBkp))



