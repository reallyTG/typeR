library(PSAgraphics)


### Name: cv.trans.psa
### Title: Transformation of Factors to Individual Levels
### Aliases: cv.trans.psa
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Note reordering of columns, binary factor and numeric column are unchanged.
f2 <- factor(sample(c(0, 1), 20, replace = TRUE))
f4 <- factor(sample(c("a", "b", "c", "d"), 20, replace = TRUE))
cv <- rnorm(20)
X <- data.frame(f2, f4, cv)
cv.trans.psa(X)
#
f2 <- factor(sample(c('c', 'C'), 20, replace = TRUE))
f4 <- factor(sample(c("b", "A", "d", "CC"), 20, replace = TRUE))
cv <- rnorm(20)
X <- data.frame(f2, f4, cv)
cv.trans.psa(X)







