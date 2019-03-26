library(DescTools)


### Name: MAD
### Title: Median Absolute Deviation
### Aliases: MAD
### Keywords: univar robust

### ** Examples

MAD(c(1:9))
print(MAD(c(1:9),     constant = 1)) ==
      MAD(c(1:8, 100), constant = 1)       # = 2 ; TRUE
x <- c(1,2,3,5,7,8)
sort(abs(x - median(x)))
c(MAD(x, constant = 1),
  MAD(x, constant = 1, low = TRUE),
  MAD(x, constant = 1, high = TRUE))



