library(netCoin)


### Name: allNet
### Title: Networked coincidences from incidences data.
### Aliases: allNet

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", sep = "; ")[2:4]
allNet(data) # network object



