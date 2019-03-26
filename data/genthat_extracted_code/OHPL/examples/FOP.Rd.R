library(OHPL)


### Name: FOP
### Title: Fisher Optimal Partition
### Aliases: FOP

### ** Examples

X = matrix(c(
  9.3, 1.8, 1.9, 1.7, 1.5, 1.3,
  1.4, 2.0, 1.9, 2.3, 2.1))
C = dlc(X, maxk = 8)$C
F = FOP(X, 8, C)



