library(DescTools)


### Name: HotellingsT2Test
### Title: Hotelling's T2 Test
### Aliases: HotellingsT2Test HotellingsT2Test.default
###   HotellingsT2Test.formula
### Keywords: htest multivariate

### ** Examples

math.teach <- data.frame(
  teacher = factor(rep(1:2, c(3, 6))),
  satis   = c(1, 3, 2, 4, 6, 6, 5, 5, 4),
  know    = c(3, 7, 2, 6, 8, 8, 10, 10, 6))

with(math.teach,
  HotellingsT2Test(cbind(satis, know) ~ teacher))



