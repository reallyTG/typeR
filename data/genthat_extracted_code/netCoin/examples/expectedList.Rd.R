library(netCoin)


### Name: expectedList
### Title: Expected list.
### Aliases: expectedList

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", sep = "; ")[2:4]
C <- coin(data) # coincidence matrix
expectedList(C) # edge data frame



