library(rexpokit)


### Name: coo2mat
### Title: Convert a COO-formated matrix to standard square format
### Aliases: coo2mat

### ** Examples

# Example use:
ia = c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4)
ja = c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4)
a  = c(-1.218, 0.126, 0.168, 0.126, 0.504, -0.882, 0.504,
0.672, 0.336, 0.252, -1.050, 0.252, 0.378, 0.504, 0.378, -1.050)
coomat = cbind(ia, ja, a)
print(coomat)
n = 4
Qmat = coo2mat(coomat, n)
print(Qmat)



