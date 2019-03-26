library(PPRL)


### Name: Create581
### Title: Create Encrypted Statistical Linkage Keys
### Aliases: Create581 ESL 581 Australian

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <- read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# Encrypt data
res <- Create581(ID = testData$V1,
  data = testData[, c(2, 3, 7, 8)],
  code = list(0, 0, c(2, 3), c(2, 3, 5)),
  password = "(H]$6Uh*-Z204q")

# Code: 0 means the whole string is used, 
# c(2, 3) means the second and third letter of the string is used




