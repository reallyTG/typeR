library(PPRL)


### Name: DeterministicLinkage
### Title: Deterministic Record Linkage
### Aliases: DeterministicLinkage 'Record Linkage'

### ** Examples

# load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <- read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# define year of birth (V3) as blocking variable
bl <- SelectBlockingFunction("V3", "V3", method = "exact")

# Select first name and last name as linking variables,
# to be linked using the soundex phonetic (first name)
# and exact matching (last name)
l1 <- SelectSimilarityFunction("V7", "V7", method = "Soundex")
l2 <- SelectSimilarityFunction("V8", "V8", method = "exact")

# Link the data as specified in bl and l1/l2
# (in this small example data is linked to itself)
res <- DeterministicLinkage(testData$V1, testData,
  testData$V1, testData, similarity = c(l1, l2), blocking = bl)




