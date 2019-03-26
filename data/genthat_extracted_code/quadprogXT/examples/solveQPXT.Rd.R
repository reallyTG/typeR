library(quadprogXT)


### Name: solveQPXT
### Title: Solve a quadratic program with absolute values in constraints &
###   objective
### Aliases: solveQPXT buildQP

### ** Examples

##quadprog example"
Dmat       <- matrix(0,3,3)
diag(Dmat) <- 1
dvec       <- c(0,5,0)
Amat       <- matrix(c(-4,-3,0,2,1,0,0,-2,1),3,3)
bvec       <- c(-8,2,0)
qp <- quadprog::solve.QP(Dmat,dvec,Amat,bvec=bvec)
qpXT <- solveQPXT(Dmat,dvec,Amat,bvec=bvec)
range(qp$solution - qpXT$solution)

N <- 10
set.seed(2)
cr <- matrix(runif(N * N, 0, .05), N, N)
diag(cr) <- 1
cr <- (cr + t(cr)) / 2
set.seed(3)
sigs <- runif(N, min = .02, max = .25)
set.seed(5)
dvec <- runif(N, -.1, .1)
Dmat <- sigs %o% sigs * cr
Amat <- cbind(diag(N), diag(N) * -1)
bvec <- c(rep(-1, N), rep(-1, N))
resBase <- solveQPXT(Dmat, dvec, Amat, bvec)
##absolute value constraint on decision variable:
res <- solveQPXT(Dmat, dvec, Amat, bvec,
AmatPosNeg = matrix(rep(-1, 2 * N)), bvecPosNeg = -1)
sum(abs(res$solution[1:N]))

## penalty of L1 norm
resL1Penalty <- solveQPXT(Dmat, dvec, Amat, bvec, dvecPosNeg = -.005 * rep(1, 2 * N))
sum(abs(resL1Penalty$solution[1:N]))

## constraint on amount decision variable can vary from a starting point
b0 <- rep(.15, N)
thresh <- .25
res <- solveQPXT(Dmat, dvec, Amat, bvec, b0 = b0,
AmatPosNegDelta = matrix(rep(-1, 2 * N)), bvecPosNegDelta = -thresh)
sum(abs(res$solution[1:N] - b0))

##use buildQP, then call solve.QP.compact directly
qp <- buildQP(Dmat, dvec, Amat, bvec, b0 = b0,
AmatPosNegDelta = matrix(rep(-1, 2 * N)), bvecPosNegDelta = -thresh)
res2 <- do.call(quadprog::solve.QP.compact, qp)
range(res$solution - res2$solution)



