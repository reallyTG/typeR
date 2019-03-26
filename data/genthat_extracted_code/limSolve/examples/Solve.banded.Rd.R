library(limSolve)


### Name: Solve.banded
### Title: Solution of a banded system of linear equations
### Aliases: Solve.banded
### Keywords: array

### ** Examples

# 1. Generate a banded matrix of random numbers, full format
nup  <- 2                         # nr nonzero bands above diagonal
ndwn <- 3                         # nr nonzero bands below diagonal
nn   <- 10                        # nr rows and columns of A
A <- matrix(nrow = nn, ncol = nn, data = runif(1 : (nn*nn)))
A [row(A) < col(A) - nup | row(A) > col(A) + ndwn] <- 0 
diag(A) <- 1                      # 1 on diagonal is easily recognised 

# right hand side
B <- runif(nrow(A))                

# solve it, using the default solver and banded (inputting full matrix)
Full  <- solve(A, B)
Band1 <- Solve.banded(A, nup, ndwn, B)

# 2. create banded form of matrix A
Aext <- rbind(matrix(ncol = ncol(A), nrow = nup, 0),
              A, 
              matrix(ncol = ncol(A), nrow = ndwn, 0))
              
abd  <- matrix(nrow = nup + ndwn + 1, ncol = nn,
               data = Aext[col(Aext) <= row(Aext) & 
                           col(Aext) >= row(Aext) - ndwn - nup])

# print both to screen
A
abd

# solve problem with banded version
Band2 <- Solve.banded(abd, nup, ndwn, B)

# compare 3 methods of solution
cbind(Full, Band1, Band2)

# same, now with 3 different right hand sides
B3 <- cbind(B, B*2, B*3)
Solve.banded(abd, nup, ndwn, B3)




