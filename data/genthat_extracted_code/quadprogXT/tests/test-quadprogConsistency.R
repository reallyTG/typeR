library(quadprogXT)

Dmat       <- matrix(0,3,3)
diag(Dmat) <- 1
dvec       <- c(0,5,0)
Amat       <- matrix(c(-4,-3,0,2,1,0,0,-2,1),3,3)
bvec       <- c(-8,2,0)
qp <- quadprog::solve.QP(Dmat,dvec,Amat,bvec=bvec)

qpXT <- solveQPXT(Dmat,dvec,Amat,bvec=bvec)

test_that("quadprog & quadprogXT return same solution for quadprog example", {
    expect_equal(qp$solution, qpXT$solution)
})
