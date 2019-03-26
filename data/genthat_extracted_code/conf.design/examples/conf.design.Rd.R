library(conf.design)


### Name: conf.design
### Title: Construct symmetric confounded factorial designs.
### Aliases: conf.design
### Keywords: design

### ** Examples

###
### Generate a 3^4 factorial with A B^2 C and B C D confounded with blocks.
###
d34 <- conf.design(rbind(c(A = 1, B = 2, C = 1, D = 0),
                         c(A = 0, B = 1, C = 1, D = 1)), p = 3)
head(d34)
###   Blocks A B C D
### 1     00 0 0 0 0
### 2     00 1 2 1 0
### 3     00 2 1 2 0
### 4     00 2 2 0 1
### 5     00 0 1 1 1
### 6     00 1 0 2 1

as.matrix(replications(~ .^2, d34))
###           [,1]
###  Blocks      9
###  A          27
###  B          27
###  C          27
###  D          27
###  Blocks:A    3
###  Blocks:B    3
###  Blocks:C    3
###  Blocks:D    3
###  A:B         9
###  A:C         9
###  A:D         9
###  B:C         9
###  B:D         9
###  C:D         9



