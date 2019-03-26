library(PPRL)


### Name: CreateBitFlippingBF
### Title: Permanent Randomized Response Bloom Filters
### Aliases: CreateBitFlippingBF RRT 'Permanent Randomized Response'

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <-read.csv(testFile, head = FALSE,
  sep = "\t", colClasses = "character")

## Encode data into Bloom Filters
BF <- CreateBF(ID = testData$V1, data = testData$V7,
  k = 20, padding = 1, q = 2, l = 1000,
  password = "(H]$6Uh*-Z204q" )

# Create Permanent Randomized Response Bloom Filter
RR <- CreateBitFlippingBF(BF, password = "l+kfdj1J", f = 0.1)




