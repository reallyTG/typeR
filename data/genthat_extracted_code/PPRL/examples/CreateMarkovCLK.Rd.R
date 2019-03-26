library(PPRL)


### Name: CreateMarkovCLK
### Title: Create CLKs with Markov Chain-based transition matrix
### Aliases: CreateMarkovCLK 'Markov Chains'

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <-read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

## Not run: 
##D # Load example Markov chain matrix (created from NC Voter Data)
##D markovFile <-file.path(path.package("PPRL"), "extdata/TestMatrize.csv")
##D markovData <-read.csv(markovFile,  sep = " ",
##D   header = TRUE, check.names = FALSE)
##D markovData <- as.matrix(markovData)
##D 
##D # Create Markov CLK using
##D CLKMarkov <- CreateMarkovCLK(ID = testData$V1,
##D   data = testData[, c(2, 3, 7, 8)],
##D   markovTable = markovData,
##D   k1 = 20, k2 = 4, l = 1000,
##D   padding = c(0, 0, 1, 1),
##D   q = c(1, 2, 2, 2),
##D   password = c("(H]$6Uh*-Z204q", "lkjg", "klh", "KJHklk5"),
##D   includeOriginalBigram = TRUE)
## End(Not run)



