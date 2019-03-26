library(binda)


### Name: binda.ranking
### Title: Binary Discriminant Analysis: Variable Ranking
### Aliases: binda.ranking plot.binda.ranking
### Keywords: multivariate

### ** Examples

# load "binda" library
library("binda")

# training data set with labels
Xtrain = matrix(c(1, 1, 0, 1, 0, 0,
             1, 1, 1, 1, 0, 0,
             1, 0, 0, 0, 1, 1,
             1, 0, 0, 0, 1, 1), nrow=4, byrow=TRUE)
colnames(Xtrain) = paste0("V", 1:ncol(Xtrain))
is.binaryMatrix(Xtrain) # TRUE
L = factor(c("Treatment", "Treatment", "Control", "Control") )

# ranking variables
br = binda.ranking(Xtrain, L)
br
#   idx    score t.Control t.Treatment
#V2   2 4.000000 -2.000000    2.000000
#V4   4 4.000000 -2.000000    2.000000
#V5   5 4.000000  2.000000   -2.000000
#V6   6 4.000000  2.000000   -2.000000
#V3   3 1.333333 -1.154701    1.154701
#V1   1 0.000000  0.000000    0.000000
#attr(,"class")
#[1] "binda.ranking"
#attr(,"cl.count")
#[1] 2

# show plot
plot(br)

# result: variable V1 is irrelevant for distinguishing the two groups





