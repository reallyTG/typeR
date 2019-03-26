library(rrcov3way)


### Name: unfold
### Title: Matrix unfolding
### Aliases: unfold
### Keywords: array multivariate algebra

### ** Examples


(X <- array(1:24, c(4,3,2)))
dim(X)

## matricize the array

##  matricized X with the A-mode entities in its rows
##  all the frontal slices of the array next to each other
##
(Xa <- unfold(X))
dim(Xa)

## matricized X with the B-mode entities in its rows
##  all the horizontal slices of the array next to each other
##
(Xb <- unfold(X, mode="B"))
dim(Xb)

## matricized X with the C-mode entities in its rows
##  all the lateral slices of the array next to each other
##
(Xc <- unfold(X, mode="C"))
dim(Xc)



