library(PPRL)


### Name: WolframRule90
### Title: Apply Wolframs rule 90 on bit vectors
### Aliases: WolframRule90 'Rule 90' 'Cellular Automata'

### ** Examples

# Load test data
testFile <- file.path(path.package("PPRL"), "extdata/testdata.csv")
testData <- read.csv(testFile, head = FALSE, sep = "\t",
  colClasses = "character")

# Create bit vector e.g. by CreateCLK or CreateBF
CLK <- CreateCLK(ID = testData$V1, 
  data = testData[, c(2, 3, 7, 8)],
  k = 20, padding = c(0, 0, 1, 1), 
  q = c(1, 1, 2, 2), l = 1000, 
  password = c("HUh4q", "lkjg", "klh", "Klk5"))

# Apply rule 90 once  
res <- WolframRule90(CLK$ID, CLK$CLK, lenBloom = 1000, t = 1)




