library(REAT)


### Name: howard.cl
### Title: Howard-Newman-Tarp colocation index
### Aliases: howard.cl

### ** Examples

# example from Howard et al. (2016):
firms <- 1:6
industries <- c("A", "B", "A", "B", "A", "B")
locations <- c("X", "X", "X", "Y", "Y", "X")

howard.cl(firms, industries, locations, industry1 = "A", 
industry2 = "B")



