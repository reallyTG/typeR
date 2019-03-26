library(paleotree)


### Name: exhaustionFunctions
### Title: Analyses of the exhaustion of Character States Over Evolutionary
###   History
### Aliases: exhaustionFunctions accioExhaustionCurve
###   accioBestAcquisitionModel charExhaustPlot

### ** Examples

## No test: 

# get data
data(SongZhangDicrano)

dicranoTree <- cladogramDicranoX13

# modify char data
charMat <- data.matrix(charMatDicrano)
charMat[is.na(charMatDicrano)] <- 0
charMat <- (charMat-1)
colnames(charMat) <- NULL
# replace missing values
charMat[is.na(charMatDicrano)] <- "?"

# the 'outgroup' is Exigraptus, first taxon listed in the matrix
exhaustionResults <- accioExhaustionCurve(phyloTree = dicranoTree,
   charData = charMat, charTypes = "unordered",
   outgroup = "Exigraptus_uniformis")

# fits models to exhaustion for total accumulation
accioBestAcquisitionModel(exhaustion_info = exhaustionResults,
 changesType = "totalAcc", 	
 models = c("exponential","gamma","lognormal","zipf")) 

# plot of exhausation of total accumulation of character states
charExhaustPlot(exhaustion_info = exhaustionResults,
	   changesType = "totalAcc")

# plot of exhausation of character alterations
charExhaustPlot(exhaustion_info = exhaustionResults,
	   changesType = "charAlt")

## End(No test)	



