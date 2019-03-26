library(PPRL)


### Encoding: UTF-8

### Name: CreateRecordLevelBF
### Title: Record Level Bloom Filter (RLBF) Encoding
### Aliases: CreateRecordLevelBF RLBF 'Record Level Bloom Filter' Durham

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
## Not run: 
##D testData <- read.csv(testFile, head = FALSE, sep = "\t",
##D   colClasses = "character")
##D 
##D # StaticUniform
##D RLBF <- CreateRecordLevelBF(ID = testData$V1,
##D   data = testData[, c(2, 3, 7, 8)],
##D   lenRLBF = 1000, k = 20,
##D   padding = c(0, 0, 1, 1), qgram = c(1, 1, 2, 2),
##D   lenBloom = 500,
##D   password = c("(H]$6Uh*-Z204q", "lkjg", "klh", "KJHkälk5"),
##D   method = "StaticUniform")
##D 
##D # StaticWeigthed
##D RLBF <- CreateRecordLevelBF(ID = testData$V1,
##D   data = testData[, c(2, 3, 7, 8)],
##D   lenRLBF = 1000, k = 20,
##D   padding = c(0, 0, 1, 1), qgram = c(1, 1, 2, 2),
##D   lenBloom = 500,
##D   password = c("(H]$6Uh*-Z204q", "lkjg", "klh", "KJHkälk5"),
##D   method = "StaticWeigthed", weigths = c(0.1, 0.1, 0.5, 0.3))
##D 
##D # DynamicUniform
##D RLBF <- CreateRecordLevelBF(ID = testData$V1,
##D   data = testData[, c(2, 3, 7, 8)],
##D   lenRLBF = 1000, k = 20,
##D   padding = c(0, 0, 1, 1), qgram = c(1, 1, 2, 2),
##D   lenBloom = c(300, 400, 550, 500),
##D   password = c("(H]$6Uh*-Z204q", "lkjg", "klh", "KJHkälk5"),
##D   method = "DynamicUniform")
##D 
##D # DynamicWeigthed
##D RLBF <- CreateRecordLevelBF(ID = testData$V1,
##D   data = testData[, c(2, 3, 7, 8)],
##D   lenRLBF = 1000, k = 20,
##D   padding = c(0, 0, 1, 1), qgram = c(1, 1, 2, 2),
##D   lenBloom = c(300, 400, 550, 500),
##D   password = c("(H]$6Uh*-Z204q", "lkjg", "klh", "KJHkälk5"),
##D   method = "DynamicWeigthed", weigths = c(0.1, 0.1, 0.5, 0.3))
## End(Not run)



