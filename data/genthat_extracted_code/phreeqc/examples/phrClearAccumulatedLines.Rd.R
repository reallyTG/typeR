library(phreeqc)


### Name: phrClearAccumulatedLines
### Title: Clear the accumulated input buffer.
### Aliases: phrClearAccumulatedLines

### ** Examples


# This example loads some keyword input, clears the input, and displays
# the results.
phrAccumulateLine("SOLUTION 1")
phrAccumulateLine("END")
cat("The accumulated input is:", phrGetAccumulatedLines(), sep = "\n")
phrClearAccumulatedLines()
cat("The accumulated input now is:\n", phrGetAccumulatedLines(), sep = "\n")




