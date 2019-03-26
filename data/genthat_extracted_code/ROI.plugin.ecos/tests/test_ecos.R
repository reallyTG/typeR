library(ROI)
library(ROI.plugin.ecos)


check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s", msg, message)
    stop(msg)
    return(invisible(NULL))
}

## SOCP - Example - 1
## min:  1 x1 + 1 x2 + 1 x3
## s.t.     x1 == sqrt(2)
##          x1 >= ||(x2, x3)||
##
## c(sqrt(2), -1, -1)
test_cp_01 <- function(solver) {
    obj <- c(1, 1, 1)
    A <- rbind(c(1, 0, 0))
    b <- c(sqrt(2))
    G <- diag(x=-1, 3)
    h <- rep(0, 3)

    bound <- V_bound(li = 1:3, lb = rep(-Inf, 3))

    lc <- C_constraint(L = rbind(A, G), 
                       cones = c(K_zero(1), K_soc(3)), 
                       rhs = c(b, h))
    x <- OP(objective = obj, constraints = lc, types = rep("C", 3),
            bounds =  bound, maximum = FALSE)

    opt <- ROI_solve(x, solver = solver)
    
    check("CP-01@01", equal(sum(abs(opt$solution - c(sqrt(2), -1, -1))), 0))
    check("CP-01@02", equal(opt$objval, (sqrt(2) - 2)))
}

## SOCP - Example - 2
## min:  0 x1 - 2 x2 - 2 x3 + 0 x4 - 2 x5 - 2 x6
## s.t.     x1 == sqrt(2)
##          x4 == sqrt(2)
##          x1 >= ||(x2, x3)||
##          x4 >= ||(x5, x6)||
##
## c(sqrt(2), 1, 1, sqrt(2), 1, 1)
test_cp_02 <- function(solver) {
    obj <- c(0, -2, -2, 0, -2, -2)
    A <- rbind(c(1, 0, 0, 0, 0, 0),
               c(0, 0, 0, 1, 0, 0))
    b <- c(sqrt(2), sqrt(2))
    G <- diag(x=-1, 6)
    h <- rep(0, 6)

    lc <- C_constraint(L = rbind(A, G), 
                       cones = c(K_zero(2), K_soc(c(3, 3))), 
                       rhs = c(b, h))
    x <- OP(objective = obj, constraints = lc)

    opt <- ROI_solve(x, solver=solver)
    check("CP-02@01", equal(sum(abs(opt$solution - c(sqrt(2), 1, 1, sqrt(2), 1, 1))), 0))
}

## EXPP - Example - 1
## min:  x + y + z
## s.t.
## y e^(x/y) <= z
## y > 0
## x := 1
## y := 2
## c(1, 2, 2*exp(1/2))
test_cp_03 <- function(solver) {
    obj <- c(1, 1, 1)
    A <- rbind(c(1, 0, 0),
               c(0, 1, 0))
    b <- c(1, 2)
    G <- -diag(3)
    h <- rep(0, 3)

    lc <- C_constraint(L = rbind(A, G), 
                       cones = c(K_zero(2), K_expp(1)), 
                       rhs = c(b, h))
    x <- OP(objective = obj, constraints = lc)

    opt <- ROI_solve(x, solver = solver)
    check("CP-03@01", equal(opt$solution , c(1, 2, 2*exp(1/2))))
}

## EXPP - Example - 1
## max:  x + y + z
## s.t.
## y e^(x/y) <= z
## y > 0
## y == 2
## z == 2 * exp(1/2)
## c(1, 2, 2*exp(1/2))
test_cp_04 <- function(solver) {
    obj <- c(1, 1, 1)
    A <- rbind(c(0, 1, 0),
               c(0, 0, 1))
    b <- c(2, 2*exp(1/2))
    G <- diag(x=-1, 3)
    h <- rep(0, 3)

    lc <- C_constraint(L = rbind(A, G), 
                       cones = c(K_zero(2), K_expp(1)), 
                       rhs = c(b, h))
    x <- OP(objective = obj, constraints = lc, maximum = TRUE)

    opt <- ROI_solve(x, solver=solver)
    check("CP-04@01", equal(opt$solution , c(1, 2, 2*exp(1/2))))
}

## EXPP - Example - 3
## max:  x + y + z
## s.t.
## y e^(x/y) <= z
## y > 0
## y == 1
## z == exp(1)
## c(1, 1, exp(1))
test_cp_05 <- function(solver) {
    obj <- c(1, 1, 1)
    A <- rbind(c(0, 1, 0),
               c(0, 0, 1))
    b <- c(1, exp(1))
    G <- diag(x=-1, 3)
    h <- rep(0, 3)
    ## cones <- list("free"=c(1, 2), "expp"=list(3:5))
    ## bound <- as.C_bound(cones)

    lc <- C_constraint(L = rbind(A, G), 
                       cones = c(K_zero(2), K_expp(1)), 
                       rhs = c(b, h))
    x <- OP(objective = obj, constraints = lc, 
            types = rep("C", 3), maximum = TRUE)

    opt <- ROI_solve(x, solver = solver)
    check("CP-05@01", equal(opt$solution , c(1, 1, exp(1))))
}


if ( !any("ecos" %in% names(ROI_registered_solvers())) ) {
    ## This should never happen.
    cat("ROI.plugin.ecos cloud not be found among the registered solvers.\n")
} else {
    print("Start Testing!")
    local({test_cp_01("ecos")})
    local({test_cp_02("ecos")})
    local({test_cp_03("ecos")})
    local({test_cp_04("ecos")})
    local({test_cp_05("ecos")})
}

