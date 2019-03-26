library(slam)
library(ROI)
library(ROI.plugin.msbinlp)


## to simulate cran conditions
## Sys.setenv(ROI_LOAD_PLUGINS = FALSE)

check <- function(domain, condition, level=1, message="", call=sys.call(-1L)) {
    if ( isTRUE(condition) ) return(invisible(NULL))
    msg <- sprintf("in %s", domain)
    if ( all(nchar(message) > 0) ) msg <- sprintf("%s\n\t%s\n", msg, message)
    cat("Diff:", msg)
    return(invisible(NULL))
}


## LP - Multiple Solutions
## solver <- "msbinlp"
test_blp_multisol_01 <- function(solver) {
    x <- OP(objective = c(1, 1),
             constraints = L_constraint(c(1, 1), "==", 1),
             types = c("B", "B"))

    method <- head(setdiff(ROI_applicable_solvers(x), solver), 1)
    if ( length(method) == 0L )
        return(NULL)

    opt <- ROI_solve(x, solver = solver, 
                     method = method, nsol_max = 2L)
    
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
    types(x) <- rep("B", length(objective(x)))

    method <- head(setdiff(ROI_applicable_solvers(x), solver), 1)
    if ( length(method) == 0L )
        return(NULL)

    opt <- ROI_solve(x, solver = solver, 
                     method = method, nsol_max = 2L)

    sol <- do.call(rbind, solution(opt))
    y <- rbind(c(0, 1, 1, 0, 1), c(1, 0, 1, 0, 1))
    check("BLPMS-02@01", equal(nrow(sol), 2L))
    check("BLPMS-02@02", equal(ncol(sol), 5L))
    check("BLPMS-02@03", (equal(sol, y) | equal(sol, y[2:1, ])))
    sol
}

if ( !any("msbinlp" %in% names(ROI_registered_solvers())) ) {
    ## This should never happen.
    cat("ROI.plugin.msbinlp cloud not be found among the registered solvers.\n")
} else {
    print("Start Testing!")
    solver <- "msbinlp"
    local({test_blp_multisol_01(solver)})
    local({test_blp_multisol_02(solver)})
}

