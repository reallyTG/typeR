library(phreeqc)


### Name: phrGetAccumulatedLines
### Title: Retrieve the accumulated input.
### Aliases: phrGetAccumulatedLines

### ** Examples


# This example loads some keyword input and displays the contents.
phrAccumulateLine("SOLUTION 1")
phrAccumulateLine("END")
cat("The accumulated input is:", phrGetAccumulatedLines(), sep = "\n")




