library(DescTools)


### Name: GTest
### Title: G-Test for Count Data
### Aliases: GTest
### Keywords: htest distribution

### ** Examples


## From Agresti(2007) p.39
M <- as.table(rbind(c(762, 327, 468), c(484,239,477)))
dimnames(M) <- list(gender=c("M","F"),
                    party=c("Democrat","Independent", "Republican"))

(Xsq <- GTest(M))   # Prints test summary

Xsq$observed        # observed counts (same as M)
Xsq$expected        # expected counts under the null


## Testing for population probabilities
## Case A. Tabulated data
x <- c(A = 20, B = 15, C = 25)
GTest(x)
GTest(as.table(x))             # the same
x <- c(89,37,30,28,2)
p <- c(40,20,20,15,5)
try(
GTest(x, p = p)                # gives an error
)
# works
p <- c(0.40,0.20,0.20,0.19,0.01)
# Expected count in category 5
# is 1.86 < 5 ==> chi square approx.
GTest(x, p = p)                #         maybe doubtful, but is ok!

## Case B. Raw data
x <- trunc(5 * runif(100))
GTest(table(x))                # NOT 'GTest(x)'!



