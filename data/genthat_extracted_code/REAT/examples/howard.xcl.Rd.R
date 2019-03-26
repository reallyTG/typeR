library(REAT)


### Name: howard.xcl
### Title: Howard-Newman-Tarp excess colocation (XCL) index
### Aliases: howard.xcl

### ** Examples

# example from Howard et al. (2016):
firms <- 1:6
industries <- c("A", "B", "A", "B", "A", "B")
locations <- c("X", "X", "X", "Y", "Y", "X")

howard.xcl(firms, industries, locations, industry1 = "A", 
industry2 = "B")



