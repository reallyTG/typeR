library(tempR)


### Name: get.mat.diff.sign
### Title: Pairwise comparisons
### Aliases: get.mat.diff.sign

### ** Examples

# Toy TCATA citations data for two samples: s1, s2
s1 <- t(data.frame(sweet =  c(10, 23, 25, 26, 26, 43, 44),
                   bitter = c( 4, 18, 19, 27, 36, 43, 54),
                   sour = c(40, 53, 85, 70, 46, 33, 24)))
s2 <- t(data.frame(sweet = c(11, 33, 45, 46, 56, 43, 44),
                   bitter = c( 0, 11, 11, 14, 25, 35, 34),
                   sour = c(30, 33, 35, 20, 26, 23, 24)))
colnames(s1) <- colnames(s2) <- paste0("time_", seq(5, 35, by = 5), "s")
n <- 90
signif <- get.mat.diff.sign(s1, s2, n, n)
signif



