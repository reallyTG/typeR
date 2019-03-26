library(gapfill)


### Name: Index
### Title: Index Conversions
### Aliases: Index IndexTwoOne Index IndexOneFour

### ** Examples

## IndexTwoOne
IndexTwoOne(c(2, 2), c(2, 5))
v <- 1:10
dimTwo <- c(2, 5)
m <- array(v, dimTwo)
stopifnot(v[IndexTwoOne(c(2, 2), dimTwo)] == m[2,2])

 
## IndexOneFour
IndexOneFour(13, c(2, 2, 2, 2))
w <- 1:16
dimFour <- c(2, 2, 2, 2)
a <- array(w, dimFour)
stopifnot(a[1,1,2,2] == w[13])




