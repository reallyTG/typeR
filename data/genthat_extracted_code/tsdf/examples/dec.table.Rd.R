library(tsdf)


### Name: dec.table
### Title: generate three-stage dose-finding decision table
### Aliases: dec.table

### ** Examples

alpha.l <- 0.6
alpha.r <- 0.4
alpha.u <- 0.1
pt <- 0.3
# print out decision table for a 3+3+3 design 
n <- rep(3, 3)
dec.table(alpha.l, alpha.r, alpha.u, pt, n)$table
# 3+3 design
n <- rep(3, 2)
dec.table(alpha.l, alpha.r, alpha.u, pt, n)$table



