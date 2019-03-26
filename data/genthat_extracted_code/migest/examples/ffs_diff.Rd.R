library(migest)


### Name: ffs_diff
### Title: Estimation of Bilateral Migrant Flows from Bilteral Migrant
###   Stocks Using Stock Differencing
### Aliases: ffs_diff

### ** Examples

dn <- LETTERS[1:4]
P1 <- matrix(c(0, 100, 10, 0, 55, 0, 50, 5, 80, 40, 0, 40, 20, 25, 20, 0), 4, 4, 
             dimnames = list(pob = dn, por = dn), byrow = TRUE)
P2 <- matrix(c(0, 100, 60, 0, 80, 0, 75, 5, 90, 30, 0, 40, 40, 45, 0, 0), 4, 4, 
             dimnames = list(pob = dn, por = dn), byrow = TRUE)
P1; P2

ffs_diff(P1, P2, decrease = "zero")
ffs_diff(P1, P2, decrease = "return")



