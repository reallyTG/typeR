library(PPRL)


### Name: CreateDoubleBalancedBF
### Title: Double Balanced Bloomfilter Encoding
### Aliases: CreateDoubleBalancedBF 'Double Balanced Bloom Filter'

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <-read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# Create bit vectors e.g. with CreateBF
testData <- CreateBF(ID = testData$V1,
  testData$V7, k = 20, padding = 1, q = 2,
  l = 1000, password = "(H]$6Uh*-Z204q")

# Create Double Balanced Bloom Filters
DBB <- CreateDoubleBalancedBF(ID = testData$ID, data = testData$CLKs,
  password = "hdayfkgh")




