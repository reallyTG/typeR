library(gmp)


### Name: apply
### Title: Apply Functions Over Matrix Margins (Rows or Columns)
### Aliases: apply apply.bigz apply.bigq apply.default
### Keywords: arith

### ** Examples

 x <- as.bigz(matrix(1:12,3))
 apply(x,1,min)
 apply(x,2,max)

 x <- as.bigq(x ^ 3, d = (x + 3)^2)
 apply(x,1, min)
 apply(x,2, sum)
 ## now use the "..." to pass  na.rm=TRUE :
 x[2,3] <- NA
 apply(x,1, sum)
 apply(x,1, sum, na.rm = TRUE)



