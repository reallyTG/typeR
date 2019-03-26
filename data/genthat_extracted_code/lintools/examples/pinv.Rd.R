library(lintools)


### Name: pinv
### Title: Moore-Penrose pseudoinverse
### Aliases: pinv

### ** Examples

A <- matrix(c(
 1,  1, -1,  2,
 2,  2, -1,  3,
 -1, -1,  2, -3
),byrow=TRUE,nrow=3)
# multiply by 55 to retrieve whole numbers
pinv(A) * 55




