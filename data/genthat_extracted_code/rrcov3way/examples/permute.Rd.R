library(rrcov3way)


### Name: permute
### Title: Permutation of a matricized array
### Aliases: permute
### Keywords: array multivariate algebra

### ** Examples

X <- array(1:24, c(4,3,2))
dim(X)

## matricize the array

##matricized X with the A-mode entities in its rows
Xa <- unfold(X)
dim(Xa)
Xa

## matricized X with the B-mode entities in its rows
Xb <- permute(Xa, 4, 3, 2)
dim(Xb)
Xb

## matricized X with the C-mode entities in its rows
Xc <- permute(Xb, 3, 2, 4)
dim(Xc)
Xc



