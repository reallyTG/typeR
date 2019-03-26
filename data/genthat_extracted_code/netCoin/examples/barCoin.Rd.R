library(netCoin)


### Name: barCoin
### Title: Networked coincidences.
### Aliases: barCoin

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", sep = "; ")[2:4]
C <- coin(data) # coincidence matrix
N <- asNodes(C) # node data frame
E <- edgeList(C,"frequency") # edge data frame
barCoin(N,E) # barCoin object



