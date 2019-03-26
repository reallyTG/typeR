library(outcomerate)


### Name: fmat
### Title: outcomerate Formula Matrix (Internal Data)
### Aliases: fmat
### Keywords: data

### ** Examples

fmat <- outcomerate:::fmat

# Print the dimensions
dimnames(fmat)

# Say we want to know the defintion of Response Rate 2, RR2. We see
# below that the numerator (NUM) column is defined by the entries with a 1,
# or (I + P). Likewise, the denominator (DEN) is defined as
# (I + P + R + NC + O + UH + UO)
fmat[, "RR2", ]


# To use linear algebra, we define a zero-one numerator matrix 'N'
# and a zero-one denominator matrix 'D'. Our count of disposition codes
# is given here manually as 'x' (in the same order as N and D).
N = fmat[ , , 1]
D = fmat[ , , 2]
x <- c(I = 5, P = 2, R = 1, NC = 7, O = 3,
      UH = 4, UO = 8,  NE = 1, eUH = 3, eUO = 6)

# Return all rates
(x %*% N) / (x %*% D)


# The same thing can be achieved with the apply family of functions
numden <- apply(x * fmat, 2:3, sum)
numden[, 1] / numden[, 2]



