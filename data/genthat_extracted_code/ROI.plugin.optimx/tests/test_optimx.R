stopifnot(require(optimx))


library(ROI)
library(ROI.plugin.optimx)

check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s", msg, message)
    stop(msg)
    return(invisible(NULL))
}

test_nlp_01 <- function() {
    ## Rosenbrock Banana objective function
    ## https://en.wikipedia.org/wiki/Rosenbrock_function
    f <- function(x) 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2

    x <- OP( objective = F_objective(F = f, n = 2), 
             bounds = V_bound(li = 1:2, ui = 1:2, lb = c(-3, -3), ub = c(3, 3)) )
    
    # Solve Rosenbrock Banana function.
    res <- ROI_solve(x, solver = "optimx", start = c(-1, 1.5), method = "L-BFGS-B")
    stopifnot(is.numeric(solution(res)))
    
    check("NLP-01@01", equal(res$objval, 0.0))
    check("NLP-01@02", equal(res$solution, c( 1.0, 1.0 )))
}

local({test_nlp_01()})
