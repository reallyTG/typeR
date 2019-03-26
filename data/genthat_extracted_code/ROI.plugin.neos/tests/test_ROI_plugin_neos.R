
if ( FALSE ) {
    q("no")
    Rdevel
}

writeLines(c("", paste(" Test date:", Sys.time()), ""))

Sys.setenv(ROI_LOAD_PLUGINS = FALSE)

library(slam)
library(ROI)
## library(ROI.plugin.glpk)
## library(ROI.plugin.cplex)
## library(ROI.plugin.gurobi)
library(ROI.plugin.neos)

check <- function(domain, condition) {
    if ( isTRUE(condition) ) {
        STATS$success <<- c(STATS$success, domain)
    } else {
        STATS$missmatch <<- c(STATS$missmatch, domain)
    }
    return(invisible(NULL))
}

report <- function(x) {
    writeLines("")
    writeLines(sprintf("  %i successfully completed tests!", length(x$success)))
    writeLines(sprintf("  %i tests signaled missmatch!", length(x$missmatch)))
    if ( length(x$missmatch) )
        writeLines(c("", "  Missmatches:", sprintf("      %s", x$missmatch)))
    writeLines("")
}

##
## Test a normal LP
##
test_lp_01 <- function(solver) {
    mat <- matrix(c(3, 4, 2, 2, 1, 2, 1, 3, 2), nrow=3, byrow=TRUE)
    

    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L = mat,
                                       dir = c("<=", "<=", "<="),
                                       rhs = c(60, 40, 80)),
            bounds = V_bound(ui = seq_len(3), ub = c(1000, Inf, 1000), nobj = 3),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "scip")
    check("LP-01@01", equal(opt$solution, c(0, 20/3, 50/3), tol=1e-4))
    check("LP-01@02", equal(opt$objval, 230/3, tol=1e-4))


    x <- OP(objective = -c(2, 4, 3),
        constraints = L_constraint(L = mat,
                                   dir = c("<=", "<=", "<="),
                                   rhs = c(60, 40, 80)),
        maximum = FALSE)

    opt <- ROI_solve(x, solver = "neos", method = "cbc")
    check("LP-01@03", equal(opt$solution, c(0, 20/3, 50/3), tol=1e-4))
    check("LP-01@04", equal(opt$objval, -230/3, tol=1e-4))


    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L = mat,
                                       dir = c("<=", "<=", "<="),
                                       rhs = c(60, 40, 80)),
            bounds = V_bound(lb = c(1, 7, 1), nobj = 3),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "mosek")
    check("LP-01@05", equal(opt$solution, c(1, 7, 14.5), tol=1e-4))
    check("LP-01@06", equal(opt$objval, 73.5, tol=1e-4))


    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L = -mat,
                                       dir = c(">=", ">=", ">="),
                                       rhs = -c(60, 40, 80)),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "cbc")
    check("LP-01@07", equal(opt$solution, c(0, 20/3, 50/3), tol=1e-4))
    check("LP-01@08", equal(opt$objval, 230/3, tol=1e-4))


    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L = mat,
                                       dir = c("<=", "==", "<="),
                                       rhs = c(60, 42, 80)),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "scip")
    check("LP-01@09", equal(opt$solution, c(0, 6, 18), tol=1e-4))
    check("LP-01@10", equal(opt$objval, 78, tol=1e-4))
 }

## Test if ROI can handle empty constraint matrix.
test_lp_02 <- function(solver) {
    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L=matrix(0, nrow=0, ncol=3), 
                                       dir=character(), rhs=double()),
            maximum = FALSE)

    opt <- ROI_solve(x, solver = "neos", method = "cbc")
    check("LP-02@01", equal(opt$solution, c(0, 0, 0), tol=1e-4))
    check("LP-02@02", equal(opt$objval, 0, tol=1e-4))


    x <- OP(objective = c(2, 4, 3), maximum = FALSE)

    opt <- ROI_solve(x, solver = "neos", method = "scip")
    check("LP-02@03", equal(opt$solution, c(0, 0, 0), tol=1e-4))
    check("LP-02@04", equal(opt$objval, 0, tol=1e-4))
}

## Test if ROI can handle when the constraint is equal to NULL.
test_lp_03 <- function(solver) {
    x <- OP(objective = c(2, 4, 3), constraints = NULL, maximum = FALSE)

    opt <- ROI_solve(x, solver = "neos", method = "cbc")
    check("LP-03@03", equal(opt$solution, c(0, 0, 0), tol=1e-4))
    check("LP-03@03", equal(opt$objval, 0, tol=1e-4))
}

## MILP - Example - 1
## min:  3 x + 1 y + 3 z
## s.t.
##      -1 x  +    y  +   z  <=  4
##               4 y  - 3 z  <=  2
##         x  -  3 y  + 2 z  <=  3
##     x, z \in Z_+
##     y >= 0
test_milp_01 <- function(solver) {
    obj <- c(3, 1, 3)
    A <- rbind(c(-1,  2,  1),
               c( 0,  4, -3),
               c( 1, -3,  2))
    b <- c(4, 2, 3)
    bounds <- V_bound(li = c(1L, 3L), ui = c(1L, 2L),
                  lb = c(-Inf, 2), ub = c(4, 100))

    x <- OP(objective = obj,
         constraints = L_constraint(L = A,
                                    dir = c("<=", "<=", "<="),
                                    rhs = b),
         types = c("I", "C", "I"),
         bounds = bounds,
         maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "cbc")
    check("MILP-01@01", equal(opt$solution , c(4, 2.5, 3), tol=1e-01))
}

## MILP - Example - 2
## min:  3 x + 1 y + 3 z
## s.t.
##      -1 x  +    y  +   z  <=  4
##               4 y  - 3 z  <=  2
##         x  -  3 y  + 2 z  <=  3
##     x, z \in Z_+
##     y >= 0
test_milp_02 <- function(solver) {
    obj <- c(3, 1, 3)
    A <- rbind(c(-1,  2,  1),
               c( 0,  4, -3),
               c( 1, -3,  2))
    b <- c(4, 2, 3)

    x <- OP(objective = obj,
         constraints = L_constraint(L = A,
                                    dir = c("<=", "<=", "<="),
                                    rhs = b),
         types = c("I", "C", "I"),
         maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "scip")
    check("MILP-02@01", all(A %*% opt$solution <= b))
    check("MILP-02@01", equal(opt$solution , c(5, 2.75, 3), tol=1e-01))
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

    opt <- ROI_solve(x, solver = "neos", method = "SNOPT")
    solution <- c(0.476190476190476, 1.04761904761905, 2.0952380952381)
    check("QP-01@01", equal(opt$solution, solution) )
    check("QP-01@02", equal(opt$objval, -2.38095238095238) )


    x <- OP(Q_objective(diag(3), L =  c(0, -5, 0)))

    opt <- ROI_solve(x, solver = "neos", method = "PATHNLP")
    check("QP-01@03", equal(opt$solution, c(0, 5, 0)) )
    check("QP-01@04", equal(opt$objval, -12.5) )


    A <- cbind(-c(-4, -3, 0), c( 2,  1, 0),  -c( 0, -2, 1))
    x <- OP(Q_objective(-diag(3), L =  -c(0, -5, 0)),
            L_constraint(L = t(A), dir = c("<=", ">=", "<="), rhs = c(8, 2, -0)),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "couenne")
    check("QP-01@05", equal(opt$solution, solution) )
    check("QP-01@06", equal(opt$objval, 2.38095238095238) )


    x <- OP(Q_objective(-diag(3), L =  -c(0, -5, 0)),
            L_constraint(L = t(A), dir = c("<=", ">=", "<="), rhs = c(8, 2, -0)),
            bounds = V_bound(lb = c(1, 0, 1), ub = c(5, 5, 1)),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = "neos", method = "SNOPT")
    check("QP-01@07", equal(opt$solution, c(1, 0.5, 1)) )
    check("QP-01@08", equal(opt$objval, 11/8) )
}


## This test detects if each solver is using the same definition
## for quadratic constraints.
## minimize:    0.5 * (x^2 + y^2)
## subject to:  0.5 * x^2 >= 0.5
##      x, y >= 0
## solution <- c(1, 0)
test_qcqp_01 <- function(solver) {
    qo <- Q_objective(Q = diag(2), L =  numeric(2))
    qc <- Q_constraint(rbind(c(1, 0), c(0, 0)), c(0, 0), dir=">=", rhs=0.5)
    x <- OP(qo, qc)

    opt <- ROI_solve(x, solver = "neos", method = "couenne")
   
    check("QCQP-01@01", equal(opt$solution, c(1, 0), tol = 1e-4) )
    check("QCQP-01@02", equal(opt$objval, 0.5) )
}

test_qcqp_02 <- function(solver) {
    x <- OP(Q_objective(diag(2, 2), c(2, -4)))
    constraints(x) <- rbind(L_constraint(c(1, 1), "==", 6), 
                            Q_constraint(Q = diag(2, 2), L = 1:2, "<=", 30))
    bounds(x) <- V_bound(nobj = 2, ld = -2, ud = 20)

    opt <- ROI_solve(x, solver = "neos", method = "SNOPT")
    check("QCQP-01@03", equal(opt$solution, c(2, 4), tol = 1e-4) )
    check("QCQP-01@04", equal(opt$objval, 8) )


    x <- OP(Q_objective(diag(2, 2), c(2, -4)))
    constraints(x) <- rbind(L_constraint(c(1, 1), "==", 6), 
                            Q_constraint(Q = -diag(2, 2), L = -c(1:2), ">=", -40))
    bounds(x) <- V_bound(nobj = 2, ld = 2, ud = 20)

    opt <- ROI_solve(x, solver = "neos", method = "SNOPT")
    check("QCQP-01@05", equal(opt$solution, c(2, 4), tol = 1e-4) )
    check("QCQP-01@06", equal(opt$objval, 8) )
}

test_loqc_01 <- function(solvers) {
    x <- OP(L_objective(c(2, -4)))
    constraints(x) <- rbind(L_constraint(c(1, 1), "==", 6), 
                            Q_constraint(Q = -diag(2, 2), L = -c(1:2), ">=", -40))
    bounds(x) <- V_bound(nobj = 2, ld = 2, ud = 20)

    opt <- ROI_solve(x, solver = "neos", method = "SNOPT")
    check("QCQP-01@05", equal(opt$solution, c(2, 4), tol = 1e-4) )
    check("QCQP-01@06", equal(opt$objval, -12) )
}


if ( !any("neos" %in% names(ROI_registered_solvers())) ) {
    ## This should never happen.
    cat("ROI.plugin.neos cloud not be found among the registered solvers.\n")
} else {
    print("Start Testing!")
    solver <- "neos"
    STATS <- list(success = character(), missmatch = character())
    ## Deactivate testing since we don't want to spam the neos server.
    if ( isTRUE(Sys.getenv("ROI_PLUGIN_NEOS") == "RUN_TESTS") ) {
        ## A linear Problem with linear constraints.
        local({test_lp_01(solver)})
        local({test_lp_02(solver)})
        local({test_lp_03(solver)})
        local({test_milp_01(solver)})
        local({test_milp_02(solver)})
        local({test_qp_01(solver)})
        local({test_qcqp_01(solver)})
        local({test_qcqp_02(solver)})
        local({test_loqc_01(solver)})
    }
    report(STATS)
}

