library(OpenMx)


### Name: mxAlgebra
### Title: Create MxAlgebra Object
### Aliases: mxAlgebra p2z logp2z lgamma1p omxDnbinom omxPnbinom
###   mxRobustLog %&% %^%

### ** Examples


A <- mxMatrix("Full", nrow = 3, ncol = 3, values=2, name = "A")

# Simple example: algebra B simply evaluates to the matrix A
B <- mxAlgebra(A, name = "B")

# Compute A + B
C <- mxAlgebra(A + B, name = "C")

# Compute sin(C)
D <- mxAlgebra(sin(C), name = "D")

# Make a model and evaluate the mxAlgebra object 'D'
A <- mxMatrix("Full", nrow = 3, ncol = 3, values=2, name = "A")
model <- mxModel(model="AlgebraExample", A, B, C, D )
fit   <- mxRun(model)
mxEval(D, fit)


# Numbers in mxAlgebras are upgraded to 1x1 matrices
# Example of Kronecker powering (%^%) and multiplication (%*%)
A  <- mxMatrix(type="Full", nrow=3, ncol=3, value=c(1:9), name="A")
m1 <- mxModel(model="kron", A, mxAlgebra(A %^% 2, name="KroneckerPower"))
mxRun(m1)$KroneckerPower

# Running kron 
# mxAlgebra 'KroneckerPower' 
# $formula:  A %^% 2 
# $result:
#      [,1] [,2] [,3]
# [1,]    1   16   49
# [2,]    4   25   64
# [3,]    9   36   81




