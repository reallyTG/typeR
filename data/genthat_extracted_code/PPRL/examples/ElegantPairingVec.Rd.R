library(PPRL)


### Name: ElegantPairingVec
### Title: Simple Pairing Function
### Aliases: ElegantPairingVec Pairing 'unordered pairing'

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <- read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# Create numeric data frame of day and month of birth
dataInt <- data.frame(as.integer(testData$V4), as.integer(testData$V5))

# Use unordered pairing on day and month
res <- ElegantPairingVec(testData$V1, dataInt)




