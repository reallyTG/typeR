library(PPRL)


### Name: CreateALC
### Title: Anonymous Linkage Codes (ALCs)
### Aliases: CreateALC ALC Soundex

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <- read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# Encrypt data, use Soundex for names
res <- CreateALC(ID = testData$V1,   
  data = testData[, c(2, 3, 7, 8)],
  soundex = c(0, 0, 1, 1),  
  password = "$6Uh*-Z204q")
  



