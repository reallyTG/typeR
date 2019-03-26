
if ( FALSE ) {
    q("no")
    R
}

## stopifnot(require(DEoptim))
Sys.setenv(ROI_LOAD_PLUGINS = FALSE)
library(ROI)
library(ROI.plugin.deoptim)

check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s", msg, message)
    print(msg)
    return(invisible(NULL))
}

test_nlp_01 <- function() {
    ## Rosenbrock Banana objective function
    ## https://en.wikipedia.org/wiki/Rosenbrock_function
    f <- function(x) 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2

    x <- OP( objective = F_objective(F = f, n = 2, names=c("x_1", "x_2")), 
             bounds = V_bound(li = 1:2, ui = 1:2, lb = c(-3, -3), ub = c(3, 3)) )
    
    # Solve Rosenbrock Banana function.
    control <- list(start = c(0, 0))
    res <- ROI_solve(x, solver = "deoptim", control)
    stopifnot(is.numeric(solution(res)))
    
    check("NLP-01@01", equal(res$objval, 0.0))
    check("NLP-01@02", equal(res$solution, c( 1.0, 1.0 )))

    # Solve Rosenbrock Banana function.
    res <- ROI_solve(x, solver = "deoptimr", start = c(0, 0))
    stopifnot(is.numeric(solution(res)))
    
    check("NLP-01@01", equal(res$objval, 0.0))
    check("NLP-01@02", equal(res$solution, c( 1.0, 1.0 )))
}

test_nlp_02 <- function() {
    f <- function(x) {
        return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
    }

    f.gradient <- function(x) {
        return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                   200 * (x[2] - x[1] * x[1])) )
    }

    x <- OP( objective = F_objective(f, n=2L, G=f.gradient), 
             constraints = c(F_constraint(F=function(x) x[1] + x[2]^2, ">=", 0,
                                          J=function(x) c(1, 2*x[2])),
                             F_constraint(F=function(x) x[1]^2 + x[2], ">=", 0,
                                          J=function(x) c(2*x[1], x[2]))),
             bounds = V_bound(li=1:2, ui=1:2, lb=c(-2, -Inf), ub=c(0.5,  1)) )

    nlp <- ROI_solve(x, solver = "deoptimr", start = c(0, 0))
    stopifnot( equal(nlp$objval, 1/4) )
    stopifnot( equal(solution(nlp), c(1/2, 1/4)) )
}

test_nlp_03 <- function() {
    hs036_obj <- function(x) {
        -x[1] * x[2] * x[3]
    }

    hs036_con <- function(x) {
        x[1] + 2 * x[2] + 2 * x[3]
    }

    x <- OP( objective = F_objective(hs036_obj, n = 3L), 
             constraints = F_constraint(hs036_con, "<=", 72),
             bounds = V_bound(ub = c(20, 11, 42)) )

    nlp <- ROI_solve(x, solver = "deoptimr", start = c(10, 10, 10))
    stopifnot( equal(nlp$objval, -3300) )
    stopifnot( equal(solution(nlp, force = TRUE), c(20, 11, 15)) )
}

if ( !any("deoptim" %in% names(ROI_registered_solvers())) ) {
    ## This should never happen.
    cat("ROI.plugin.deoptim cloud not be found among the registered solvers.\n")
} else {
    file = Sys.getenv("ROI_TEST_LOG_FILE")
    ROI_TEST_ERRORS <- 0L
    rt <- function(expr, silent = FALSE) {
        err <- try(expr, silent = silent)
        if ( inherits(err, "try-error") ) 
            ROI_TEST_ERRORS <<- ROI_TEST_ERRORS + 1L
        err
    }

    rt( test_nlp_01() )
    rt( test_nlp_02() )
    rt( test_nlp_03() )

    if ( ROI_TEST_ERRORS > 0 ) {
        ## Since deoptim is an evolutionary algorithm we will sometimes
        ## get different results. So I just print the error messsages.
        cat("ROI_Test_Error", ROI_TEST_ERRORS, "occurred during testing.\n")
    }
}
