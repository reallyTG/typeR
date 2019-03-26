library(lava)


### Name: diagtest
### Title: Calculate diagnostic tests for 2x2 table
### Aliases: diagtest odds riskcomp OR Ratio Diff

### ** Examples

M <- as.table(matrix(c(42,12,
                       35,28),ncol=2,byrow=TRUE,
                     dimnames=list(rater=c("no","yes"),gold=c("no","yes"))))
diagtest(M,exact=TRUE)



