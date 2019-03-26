library(PPRL)


### Name: CreateEnsembleCLK
### Title: Combine multiple independent CLKs using a simple majority rule
### Aliases: CreateEnsembleCLK 'Ensemble CLK' majority 'majority rule'

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <-read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")
## Not run: 
##D # Create Ensemble CLK
##D EnsembleCLK <- CreateEnsembleCLK(ID = testData$V1,
##D   data = testData[, c(2, 3, 7, 8)],
##D   k = 20, padding = c(0, 0, 1, 1),
##D   q = c(1, 2, 2, 2), l = 1000,
##D   password = c("HUh4q", "lkjg", "klh", "Klk5"),
##D   NumberOfCLK = 5)
## End(Not run)



