library(pracma)


### Name: and, or
### Title: Logical AND, OR (Matlab Style)
### Aliases: and or
### Keywords: logic

### ** Examples

A <- matrix(c(0.5,  0.5,  0,    0.75, 0,
              0.5,  0,    0.75, 0.05, 0.85,
              0.35, 0,    0,    0,    0.01,
              0.5,  0.65, 0.65, 0.05, 0), 4, 5, byrow=TRUE)
B <- matrix(c( 0, 1, 0, 1, 0,
               1, 1, 1, 0, 1,
               0, 1, 1, 1, 0,
               0, 1, 0, 0, 1), 4, 5, byrow=TRUE)

and(A, B)
or(A, B)



