stopifnot(require(nloptr))

Sys.setenv(ROI_LOAD_PLUGINS = FALSE)

library(ROI)
library(ROI.plugin.nloptr)

check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s", msg, message)
    stop(msg)
    return(invisible(NULL))
}


##
## Rosenbrock Banana function.
##
test_nlp_01 <- function(solver) {
    objval <- 0
    sol <- c(1, 1)
    
    obj <- function(x) {
        return( 100 * (x[2] - x[1] * x[1])^2 + (1 - x[1])^2 )
    }

    grad <- function(x) {
        return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                   200 * (x[2] - x[1] * x[1])) )
    }

    x <- OP(F_objective(F = obj, n = 2L, G = grad))
    bounds(x) <- V_bound(lb = c(-3, -3), ub = c(3, 3))

    control <- list(start = c(-1.2, 1))
    opt <- ROI_solve(x, solver = solver, control = control)

    check("NLP-01@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-01@02", equal(solution(opt, "objval"), objval, tol = 1e-4))
}

##
## Example from NLopt tutorial.
##
test_nlp_02 <- function(solver) {
    objval <- -0.5443311
    sol <- c(1/3, 8/27)

    obj <- function(x) -sqrt(x[2])
    grad <- function(x) -c(0, 0.5 / sqrt(x[2]))

    con <- function(x) (c(2, -1) * x[1] + c(0,  1))^3 - x[2]
    jac <- function(x) {
        a <- c(2, -1)
        b <- c(0,  1)
        rbind(c(3 * a[1] * (a[1] * x[1] + b[1])^2, -1.0), 
              c(3 * a[2] * (a[2] * x[1] + b[2])^2, -1.0))
    }

    x <- OP(objective = F_objective(F = obj, n = 2L, G = grad),
        constraints = F_constraint(con, c("<=", "<="), c(0, 0), J = jac),
        maximum = TRUE)
    
    control <- list(start = c(1.234, 5.678))
    opt <- ROI_solve(x, solver, control = control)

    check("NLP-02@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-02@02", equal(solution(opt, "objval"), objval, tol = 1e-4))
}

##
## Problem 23 from the Hock-Schittkowsky test suite.
##
test_nlp_03 <- function(solver) {
    objval <- 2
    sol <- c(1, 1)

    obj <- function(x) x[1]^2 + x[2]^2
    grad <- function(x) c(2 * x[1], 2 * x[2])


    con <- function(x) {
        c(1 - x[1] - x[2], 1 - x[1]^2 - x[2]^2, 9 - 9*x[1]^2 - x[2]^2,
          x[2] - x[1]^2, x[1] - x[2]^2)
    }

    jac <- function(x) {
        rbind(c(-1, -1), c(-2 * x[1], -2 * x[2]), c(-18 * x[1], -2 * x[2]),
              c(-2 * x[1], 1), c(1, -2 * x[2]))
    }

    x <- OP(objective = F_objective(F = obj, n = 2L, G = grad),
        constraints = F_constraint(F = con, dir = leq(5), rhs = double(5), J = jac),
        bounds = V_bound(ld = -50, ud = 50, nobj = 2L))

    control <- list(start = c(3, 1), max_iter = 100000)
    opt <- ROI_solve(x, solver, control = control)

    check("NLP-03@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-03@02", equal(solution(opt, "objval"), objval, tol = 1e-4))
}

##
## Problem 71 from the Hock-Schittkowsky test suite.
##
test_nlp_04 <- function(solver) {
    objval <- 17.01402
    sol <- c(1, 4.74299963, 3.82114998, 1.37940829)

    obj <- function(x) x[1] * x[4] * (x[1] + x[2] + x[3]) + x[3]
    
    grad <- function(x) {
        c(x[1] * x[4] + x[4] * (x[1] + x[2] + x[3]), x[1] * x[4],
          x[1] * x[4] + 1.0, x[1] * (x[1] + x[2] + x[3]))
    }

    con <- c(function(x) c(25 - x[1] * x[2] * x[3] * x[4]),
             function(x) x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 - 40)

    jac <- c(function(x) c(-x[2] * x[3] * x[4], -x[1] * x[3] * x[4],
                           -x[1] * x[2] * x[4], -x[1] * x[2] * x[3]),
             function(x) c(2.0 * x[1], 2.0 * x[2], 2.0 * x[3], 2.0 * x[4]))

    x <- OP(objective = F_objective(F = obj, n = 4L, G = grad),
        constraints = F_constraint(F = con, dir = c("<=", "=="), rhs = c(0, 0), J = jac),
        bounds = V_bound(ld = 1, ud = 5, nobj = 4L))

    control <- list(start = c(1, 5, 5, 1))
    opt <- ROI_solve(x, solver, control = control)

    check("NLP-04@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-04@02", equal(solution(opt, "objval"), objval, tol = 1e-4))
}


##
## Problem from 
## @article{betts1977accelerated,
##     title     = {An accelerated multiplier method for nonlinear programming},
##     author    = {Betts, JT},
##     journal   = {Journal of Optimization Theory and Applications},
##     volume    = {21},
##     number    = {2},
##     pages     = {137--174},
##     year      = {1977},
##     publisher = {Springer}
## }
##
test_nlp_05 <- function(solver) {
    objval <- 0
    sol <- c(1, 1)

    obj <- function(x) 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    
    x <- OP(objective = F_objective(F = obj, n = 2L))
    bounds(x) <- V_bound(lb = c(-Inf, -1.5))

    control <- list(start = c(2, 3))
    opt <- ROI_solve(x, solver, control)

    check("NLP-05@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-05@02", equal(solution(opt, "objval"), objval, tol = 1e-4))
}


##
## Problem from 
## @article{betts1977accelerated,
##     title     = {An accelerated multiplier method for nonlinear programming},
##     author    = {Betts, JT},
##     journal   = {Journal of Optimization Theory and Applications},
##     volume    = {21},
##     number    = {2},
##     pages     = {137--174},
##     year      = {1977},
##     publisher = {Springer}
## }
##
test_nlp_06 <- function(solver) {
    objval <- 0.0504261879
    sol <- c(2*sqrt(598/1200) * cos(1/3*acos(1/(400*(sqrt(598/1200)^3)))), 1.5)

    obj <- function(x) 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    
    x <- OP(objective = F_objective(F = obj, n = 2L))
    bounds(x) <- V_bound(lb = c(-Inf, 1.5))

    control <- list(start = c(2, 2.6))
    opt <- ROI_solve(x, solver, control = control)

    check("NLP-06@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-06@06", equal(solution(opt, "objval"), objval, tol = 1e-4))
}


## SOURCE: Rglpk manual
## https://cran.r-project.org/web/packages/Rglpk/Rglpk.pdf
## 
## LP - Example - 1
## max:  2 x_1 + 4 x_2 + 3 x_3
## s.t.
## 3 x_1  +  4 x_2  +  2 x_3  <= 60
## 2 x_1  +    x_2  +  2 x_3  <= 40
##   x_1  +  3 x_2  +  2 x_3  <= 80 
## x_1, x_2, x_3 >= 0
test_nlp_07 <- function(solver) {
    ## -----------------------------------------------------
    ## Test transformation from LP to NLP
    ## -----------------------------------------------------
    mat <- matrix(c(3, 4, 2, 2, 1, 2, 1, 3, 2), nrow=3, byrow=TRUE)
    lo <- L_objective(c(2, 4, 3))
    lc <- L_constraint(L = mat, dir = c("<=", "<=", "<="), rhs = c(60, 40, 80))
    lp <- OP(objective = lo, constraints = lc, maximum = TRUE)

    sol <- c(0, 6.66666666666667, 16.6666666666667)
    objval <- 76.6666666666667

    opt <- ROI_solve(lp, solver = "nloptr.auglag", start = c(1, 1, 1))

    check("NLP-07@01", equal(solution(opt), sol, tol = 1e-4))
    check("NLP-07@02", equal(solution(opt, "objval"), objval, tol = 1e-4))
}


if ( !any(grepl("nloptr", names(ROI_registered_solvers()))) ) {
    ## This should never happen.
    cat("ROI.plugin.nloptr cloud not be found among the registered solvers.\n")
} else {
    print("Start Testing!")
    cat("Test 01: ")
    local({test_nlp_01("nloptr.lbfgs")})
    cat("OK\n"); cat("Test 02: ")
    local({test_nlp_02("nloptr.cobyla")})
    cat("OK\n"); cat("Test 03: ")
    local({test_nlp_03("nloptr.auglag")})
    cat("OK\n"); cat("Test 04: ")
    local({test_nlp_04("nloptr.slsqp")})
}

