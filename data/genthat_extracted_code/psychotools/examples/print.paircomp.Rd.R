library(psychotools)


### Name: print.paircomp
### Title: Formatting Paired Comparison Data
### Aliases: print.paircomp format.paircomp
### Keywords: classes

### ** Examples

pc2 <- paircomp(rbind(
  c(4,  1,  0),
  c(1,  2, -1),
  c(1, -2, -1),
  c(0,  0,  -3)),
  labels = c("New York", "Rio", "Tokyo"))

print(pc2)
print(pc2, abbreviate = FALSE)
print(pc2, abbreviate = FALSE, width = 10)



