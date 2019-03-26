library(LW1949)


### Name: fill
### Title: Fill in Missing Values
### Aliases: fill

### ** Examples

numvec <- c(NA, 1:5, NA, NA, NA, 10:12, NA)
newgroup <- c(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0)
fill(numvec)
fill(numvec, newgroup)

charvec <- c("", letters[1:5], "", "", "", letters[10:12], "")
fill(charvec)



