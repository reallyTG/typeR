library(TopKLists)


### Name: prepare.idata
### Title: Prepare Idata vector of 0's and 1's
### Aliases: prepare.idata

### ** Examples

set.seed(4568)
A <- sample(1:20, 20)
B <- sample(1:20, 20)
C <- sample(1:20, 20)
mm <- data.frame(A, B, C, row.names=LETTERS[1:20])
prepare.idata(mm, d=10)

# The breast cancer example
data(breast)
Idata1 = prepare.idata(breast[,c(1,3)], d=10)
# or 
Idata2 = prepare.idata(breast[,c(1,2)], d=10)
# compare to
Idata2 = prepare.idata(breast, d=10)



