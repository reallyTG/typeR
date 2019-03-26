library(pspearman)


### Name: spearman.test
### Title: Spearman's rank correlation test with precomputed null
###   distribution
### Aliases: spearman.test
### Keywords: htest

### ** Examples

x <- 1:10
y <- c(5:1, 6, 10:7)
out1 <- spearman.test(x, y)
out2 <- spearman.test(x, y, approximation="AS89")
out3 <- cor.test(x, y, method="spearman")
out1$p.value # [1] 0.05443067  this is the exact value
out2$p.value # [1] 0.05444507  approximation obtained from AS89
out3$p.value # [1] 0.05444507  ditto



