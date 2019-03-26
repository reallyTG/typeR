library(deaR)


### Name: read_malmquist
### Title: read_malmquist
### Aliases: read_malmquist

### ** Examples

# Example 1. If you have a dataset in wide format.
data("Economy")
data_example <- read_malmquist(datadea = Economy, 
                               nper = 5, 
                               arrangement = "horizontal",
                               ni = 2, 
                               no = 1)
# This is the same as:
data_example <- read_malmquist(datadea = Economy,
                               nper = 5, 
                               arrangement = "horizontal",
                               inputs = 2:3, 
                               outputs = 4)
# Example 2. If you have a dataset in long format.
data("EconomyLong")
data_example2 <- read_malmquist(EconomyLong,
                                percol = 2, 
                                arrangement = "vertical",
                                inputs = 3:4, 
                                outputs = 5)




