library(slam)
library(ROI)
library(ROI.plugin.lpsolve)


check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s\n", msg, message)
    cat("Diff:", msg)
    return(invisible(NULL))
}

## LP - Example - 1
## max:  2 x_1 + 4 x_2 + 3 x_3
## s.t.
## 3 x_1  +  4 x_2  +  2 x_3  <= 60
## 2 x_1  +    x_2  +  2 x_3  <= 40
##   x_1  +  3 x_2  +  2 x_3  <= 80 
## x_1, x_2, x_3 >= 0
test_lp_01 <- function(solver) {
    mat <- matrix(c(3, 4, 2,
                    2, 1, 2,
                    1, 3, 2), nrow=3, byrow=TRUE)
    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L = mat,
                                       dir = c("<=", "<=", "<="),
                                       rhs = c(60, 40, 80)),
            bounds = V_bound(ui = seq_len(3), ub = c(1000, Inf, 1000), nobj = 3),
            maximum = TRUE)

    opt <- ROI_solve(x, solver = solver)
    check("LP-01@01", equal(opt$solution, c(0, 20/3, 50/3), tol=1e-4))
    check("LP-01@02", equal(opt$objval, 230/3, tol=1e-4))


    x <- OP(objective = c(2, 4, 3),
        constraints = L_constraint(L = mat,
                                   dir = c("<=", "<=", "<="),
                                   rhs = c(60, 40, 80)),
        maximum = TRUE)

    opt <- ROI_solve(x, solver = solver)
    check("LP-01@01", equal(opt$solution, c(0, 20/3, 50/3), tol=1e-4))
    check("LP-01@02", equal(opt$objval, 230/3, tol=1e-4))
}

## Test if ROI can handle empty constraint matrix.
test_lp_02 <- function(solver) {
    x <- OP(objective = c(2, 4, 3),
            constraints = L_constraint(L=matrix(0, nrow=0, ncol=3), 
                                       dir=character(), rhs=double()),
            maximum = FALSE)

    opt <- ROI_solve(x, solver = solver)
    check("LP-02@01", equal(opt$solution, c(0, 0, 0), tol=1e-4))
    check("LP-02@02", equal(opt$objval, 0, tol=1e-4))
}

## Test if ROI can handle when the constraint is equal to NULL.
test_lp_03 <- function(solver) {
    x <- OP(objective = c(2, 4, 3), constraints = NULL, maximum = FALSE)

    opt <- ROI_solve(x, solver = solver)
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

    control <- list()
    opt <- ROI_solve(x, solver=solver, control=control)
    
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

    opt <- ROI_solve(x, solver=solver)
    check("MILP-02@01", all(A %*% opt$solution <= b))
    check("MILP-02@01", equal(opt$solution , c(5, 2.75, 3), tol=1e-01))
}

## LP - Multiple Solutions
## solver <- "msbinlp"
test_blp_multisol_01 <- function(solver) {
    x <- OP(objective = c(1, 1),
             constraints = L_constraint(c(1, 1), "==", 1),
             types = c("B", "B"))

    opt <- ROI_solve(x, solver = solver, nsol_max = 2L)
    
    sol <- do.call(rbind, solution(opt))
    check("BLPMS-01@01", equal(nrow(sol), 2L))
    check("BLPMS-01@02", equal(ncol(sol), 2L))
    check("BLPMS-01@03", (equal(sol, diag(2)) | equal(sol, diag(2)[2:1, ])))
    sol
}

## -----------------------------------------------------------------------------
##
## Pruning Moves [Matteo Fischetti, Domenico Salvagnin] (2009)
##
## -----------------------------------------------------------------------------
## min   - x_1 - x_2 - x_3 - x_4 - 99 x_5
## s.t.  x_1 + x_2 <= 1
##       x_3 + x_4 <= 1
##       x_4 + x_5 <= 1
##       x_i in {0, 1}
test_blp_multisol_02 <- function(solver) {
    x <- OP()
    objective(x) <- L_objective(c(-1, -1, -1, -1, -99))
    mat <- simple_triplet_matrix(rep(1:3, 2), 
                                 c(c(1, 3, 4), c(2, 4, 5)), 
                                 rep(1, 6))
    constraints(x) <- L_constraint(mat, 
                                   dir = leq(3), 
                                   rhs = rep.int(1, 3))
    types(x) <- rep("B", length(x))

    opt <- ROI_solve(x, solver = solver, nsol_max = 2L)

    sol <- do.call(rbind, solution(opt))
    y <- rbind(c(0, 1, 1, 0, 1), c(1, 0, 1, 0, 1))
    check("BLPMS-02@01", equal(nrow(sol), 2L))
    check("BLPMS-02@02", equal(ncol(sol), 5L))
    check("BLPMS-02@03", (equal(sol, y) | equal(sol, y[2:1, ])))
    sol
}

if ( !any("lpsolve" %in% names(ROI_registered_solvers())) ) {
    ## This should never happen.
    cat("ROI.plugin.lpsolve cloud not be found among the registered solvers.\n")
} else {
    print("Start Testing!")
    solver <- "lpsolve"
    local({test_lp_01(solver)})
    local({test_lp_02(solver)})
    local({test_lp_03(solver)})
    local({test_milp_01(solver)})
    local({test_milp_02(solver)})
}

