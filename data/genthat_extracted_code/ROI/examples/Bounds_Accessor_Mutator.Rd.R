library(ROI)


### Name: bounds (Set/Get)
### Title: Bounds - Accessor and Mutator Functions
### Aliases: 'bounds (Set/Get)' bounds bounds.OP bounds<-

### ** Examples

## Not run: 
##D lp_obj <- L_objective(c(1, 2))
##D lp_con <- L_constraint(c(1, 1), dir="==", rhs=2)
##D lp_bound <- V_bound(ui=1:2, ub=c(3, 3))
##D lp <- OP(objective=lp_obj, constraints=lp_con, bounds=lp_bound, maximum=FALSE)
##D bounds(lp)
##D x <- ROI_solve(lp)
##D x$objval
##D x$solution
##D bounds(lp) <- V_bound(ui=1:2, ub=c(1, 1))
##D y <- ROI_solve(lp)
##D y$objval
##D y$solution
## End(Not run)



