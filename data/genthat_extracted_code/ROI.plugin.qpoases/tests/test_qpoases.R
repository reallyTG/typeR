if (FALSE) {
    q("no")
    Rdevel
}

Sys.setenv("ROI_LOAD_PLUGINS" = FALSE)
library(ROI)
library(ROI.plugin.qpoases)


check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s", msg, message)
    stop(msg)
    return(invisible(NULL))
}

## QP - Example - 1
##
## from the quadprog package
## (c) S original by Berwin A. Turlach R port by Andreas Weingessel
## GPL-3
##
## min: -(0 5 0) %*% x + 1/2 x^T x
## under the constraints:      A^T x >= b
## with b = (-8,2,0)^T
## and      (-4  2  0)
##      A = (-3  1 -2)
##          ( 0  0  1)
## we can use solve.QP as follows:
##
## library(quadprog)
## D <- diag(1, 3)
## d <- c(0, 5, 0)
## A <- cbind(c(-4, -3, 0), 
##            c( 2,  1, 0), 
##            c( 0, -2, 1))
## b <- c(-8, 2, 0)
## 
## sol <- solve.QP(D, d, A, bvec=b)
## deparse(sol$solution)
## deparse(sol$value)
test_qp_01 <- function(solver) {

    A <- cbind(c(-4, -3, 0), 
               c( 2,  1, 0), 
               c( 0, -2, 1))
    x <- OP(Q_objective(diag(3), L =  c(0, -5, 0)),
            L_constraint(L = t(A),
                         dir = rep(">=", 3),
                         rhs = c(-8, 2, 0)))

    opt <- ROI_solve(x, solver=solver, hessian_type = 1L)
    solution <- c(0.476190476190476, 1.04761904761905, 2.0952380952381)
    check("QP-01@01", equal(opt$solution, solution) )
    check("QP-01@02", equal(opt$objval, -2.38095238095238) )

}

## This Test detects non-conform objective functions.
## minimize 0.5 x^2 - 2 x + y
## s.t. x <= 3
## Type 1:   0.5 x'Qx + c'Lx => c(2, 0)  objval=-2
## Type 2:       x'Qx + c'Lx => c(3, 0)  objval=-3.75
test_qp_02 <- function(solver) {

    zero <- .Machine$double.eps * 100
    qo <- Q_objective(Q=rbind(c(1, 0), c(0, zero)), L=c(-2, 1))
    lc1 <- L_constraint(L=matrix(c(1, 0), nrow=1), dir="<=", rhs=3)
    lc2 <- L_constraint(L=matrix(c(1, 0), nrow=1), dir=">=", rhs=0)
    x <- OP(qo, c(lc1, lc2))

    opt <- ROI_solve(x, solver=solver)
    solution <- c(2, 0)
    check("QP-02@01", equal(opt$solution, solution) )
    check("QP-02@02", equal(opt$objval, -2) )

}

## as qp_01 but maximize
test_qp_03 <- function(solver) {
    A <- cbind(c(-4, -3, 0), 
               c( 2,  1, 0), 
               c( 0, -2, 1))
    x <- OP(Q_objective(-diag(3), L = -c(0, -5, 0)),
            L_constraint(L = t(A),
                         dir = rep(">=", 3),
                         rhs = c(-8, 2, 0)),
            maximum = TRUE)

    opt <- ROI_solve(x, solver=solver, hessian_type = 1L)
    solution <- c(0.476190476190476, 1.04761904761905, 2.0952380952381)
    check("QP-01@01", equal(opt$solution, solution) )
    check("QP-01@02", equal(opt$objval, 2.38095238095238) )
}


if ( !any("qpoases" %in% names(ROI_registered_solvers())) ) {
    ## This should never happen.
    cat("ROI.plugin.qpoases cloud not be found among the registered solvers.\n")
} else {
    solver <- "qpoases"
    print("Start Testing!")
    local({test_qp_01(solver)})
    local({test_qp_02(solver)})
    local({test_qp_03(solver)})
}

