library(BHH2)


### Name: ffDesMatrix
### Title: Full or fractional factorial design matrix generation
### Aliases: ffDesMatrix
### Keywords: design

### ** Examples

ffDesMatrix(5) # Full 2^5 factorial design
ffDesMatrix(5,gen=list(c(5,1,2,3,4))) # 2^(5-1) factorial design
ffDesMatrix(5,gen=list(c(4,1,2),c(-5,1,3))) # 2^(5-2) factorial design



