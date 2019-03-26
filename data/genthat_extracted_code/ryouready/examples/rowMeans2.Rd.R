library(ryouready)


### Name: rowMeans2
### Title: Form row means taking into account a minimum number of values
###   required
### Aliases: rowMeans2

### ** Examples

x <- replicate(3, runif(5))
 x[1:3, 1] <- NA       # add NAs to data
 x[1:2, 2] <- NA
 x[1, 3] <- NA
 x
 rowMeans2(x)          # the same as rowMeans, except that NAs are allowed
 rowMeans2(x, min=2)   # minimum two values to calculate mean
 rowMeans2(x, min=3)   # minimum three values to calculate mean

 # returns numeric(0) if x has zero rows
 d <- x[NULL, ]
 rowMeans2(d)

 # weights for each column
 rowMeans2(x, w=c(1,1,2))



