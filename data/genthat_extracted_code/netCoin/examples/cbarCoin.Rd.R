library(netCoin)


### Name: cbarCoin
### Title: Networked coincidences.
### Aliases: cbarCoin

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", sep = "; ")[2:4]
C <- coin(data) # coincidence matrix
N <- asNodes(C) # node data frame
E <- edgeList(C,"frequency","expected") # edge data frame
cbarCoin(N,E) # barCoin object



