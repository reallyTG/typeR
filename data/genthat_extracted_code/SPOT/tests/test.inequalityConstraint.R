
test_that("check optimNLOPTR interface (no constraint)", {
	### first example: only using nloptr
	res <- optimNLOPTR(,fun = funSphere,lower = c(-10,-20),upper=c(20,8))
	expect_equal(length(res$xbest),2)
	res
})

test_that("check optimNLOPTR + inequality constraint", {
	### second example: NLOPTR + inequality constraint
	contr <- list()  #control list
	###specify constraint
	contr$eval_g_ineq <- function(x) 1+x[1]-x[2]
	res <- optimNLOPTR(,fun = funSphere,lower = c(-10,-20),upper=c(20,8),control=contr) # with default algorithm="NLOPT_GN_ORIG_DIRECT_L"
	expect_equal(length(res$xbest),2)
	res #note: DIRECT is deterministic
	contr$opts$algorithm <- "NLOPT_GN_ISRES"
	res <- optimNLOPTR(,fun = funSphere,lower = c(-10,-20),upper=c(20,8),control=contr) # with ISRES
	expect_equal(length(res$xbest),2)
	res #note: ISRES is not deterministic, and may also need more evaluations (increase funEvals)
})


test_that("check SPOT+NLOPTR with inequality constraints but with default design", {
	### third example of SPOT+NLOPTR with inequality constraints
	contr <- list()  
	contr$eval_g_ineq <- function(x) 1+x[1]-x[2] 
	contr$funEvals <- 100 #the surrogate budget. can be larger.
	contr$opts$algorithm <- "NLOPT_GN_ISRES"
	res <- spot(,fun = funSphere,lower = c(-10,-20),upper=c(20,8),
			control=list(
				funEvals=15, #number of fun evaluations
				modelControl=list(target="ei"),
				optimizer=optimNLOPTR,
				optimizerControl=contr
			)
		)
	res$xbest
	res$ybest
	###note: the initial design (LHD) may still violate the constraints. need to change design function, too, to avoid this.
	expect_true(!all(apply(res$x,1,contr$eval_g_ineq) <=0)) # this checks which of the candidate solutions are feasible
})

test_that("check SPOT+NLOPTR with inequality constraints also in design", {
	### third example of SPOT+NLOPTR with inequality constraints
	contr <- list()  
	contr$eval_g_ineq <- function(x) 1+x[1]-x[2] 
	contr$funEvals <- 100 #the surrogate budget. can be larger.
	contr$opts$algorithm <- "NLOPT_GN_ISRES"
	res <- spot(,fun = funSphere,lower = c(-10,-20),upper=c(20,8),
			control=list(
				funEvals=15, #number of fun evaluations
				modelControl=list(target="ei"),
				optimizer=optimNLOPTR,
				optimizerControl=contr,
				designControl=list(inequalityConstraint=contr$eval_g_ineq)
			)
		)
	res$xbest
	res$ybest
	###note: the initial design (LHD) may still violate the constraints. need to change design function, too, to avoid this.
	expect_true(all(apply(res$x,1,contr$eval_g_ineq) <=0)) # this checks which of the candidate solutions are feasible
})