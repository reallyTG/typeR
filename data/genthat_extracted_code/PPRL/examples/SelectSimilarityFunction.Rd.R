library(PPRL)


### Name: SelectSimilarityFunction
### Title: Select Similarity Function for Linkage
### Aliases: SelectSimilarityFunction Similarity Linkage

### ** Examples

# load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <- read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# define year of birth (V3) as blocking variable
bl <- SelectBlockingFunction("V3", "V3", method = "exact")

# Select first name and last name as linking variables,
# to be linked using the jaro-winkler (first name)
# and exact matching (last name)
l1 <- SelectSimilarityFunction("V7","V7", method = "jw",
  ind_c0 = FALSE, ind_c1 = FALSE , m = 0.9, u = 0.1,
  lower = 0.0, upper = 0.0)
l2 <- SelectSimilarityFunction("V8","V8", method = "exact")

# Link the data as specified in bl and l1/l2
# (in this small example data is linked to itself)
res <- ProbabilisticLinkage(testData$V1, testData,
  testData$V1, testData, similarity = c(l1, l2), blocking = bl)




