library(qrmtools)


### Name: hierarchical_matrix
### Title: Construction of Hierarchical Matrices
### Aliases: hierarchical_matrix
### Keywords: utilities

### ** Examples

rho <- c(0.2, 0.3, 0.5, 0.8) # some entries (e.g., correlations)

## Test homogeneous case
x <- list(rho[1], 1:6)
hierarchical_matrix(x)

## Two-level case with one block of size 2
x <- list(rho[1], 1, list(rho[2], 2:3))
hierarchical_matrix(x)

## Two-level case with one block of size 2 and a larger homogeneous block
x <- list(rho[1], 1:3, list(rho[2], 4:5))
hierarchical_matrix(x)

## Test two-level case with three blocks of size 2
x <- list(rho[1], NULL, list(list(rho[2], 1:2),
                             list(rho[3], 3:4),
                             list(rho[4], 5:6)))
hierarchical_matrix(x)

## Test three-level case
x <- list(rho[1], 1:3, list(rho[2], NULL, list(list(rho[3], 4:5),
                                               list(rho[4], 6:8))))
hierarchical_matrix(x)

## Test another three-level case
x <- list(rho[1], c(3, 6, 1), list(rho[2], c(9, 2, 7, 5),
                                   list(rho[3], c(8, 4))))
hierarchical_matrix(x)



