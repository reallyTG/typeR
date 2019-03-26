library(ChainLadder)


### Name: ClarkLDF
### Title: Clark LDF method
### Aliases: ClarkLDF
### Keywords: models

### ** Examples

X <- GenIns
ClarkLDF(X, maxage=20)

# Clark's "LDF method" also works with triangles that have  
# more development periods than origin periods
ClarkLDF(qincurred, G="loglogistic")

# Method also works for a "triangle" with only one row:
# 1st row of GenIns; need "drop=FALSE" to avoid becoming a vector.
ClarkLDF(GenIns[1, , drop=FALSE], maxage=20)

# The age of the first evaluation may be prior to the end of the origin period.
# Here the ages are in units of "months" and the first evaluation 
# is at the end of the third quarter.
X <- GenIns
colnames(X) <- 12 * as.numeric(colnames(X)) - 3
# The indicated liability increases from 1st example above, 
# but not significantly.
ClarkLDF(X, maxage=240)
# When maxage is infinite, the phase shift has a more noticeable impact:
# a 4-5% increase of the overall CV.
x <- ClarkLDF(GenIns, maxage=Inf)
y <- ClarkLDF(X, maxage=Inf)
# Percent change in the bottom line CV:
(tail(y$Table65$TotalCV, 1) - tail(x$Table65$TotalCV, 1)) / tail(x$Table65$TotalCV, 1)




