library(ROI)
library(ROI.models.netlib)

netlib()
## get all problems as a list
ntlb <- netlib("all")
## get a certain problem by name
netlib("afiro")
ntlb[["afiro"]]
## get the meta info to the problems
netlib("metainfo")
afiro <- netlib("afiro")

if ( length(ROI_applicable_solvers(afiro)) ) {
	## solve a problem
	sol <- ROI_solve(afiro)
	sol
	stopifnot( equal(sol$objval, 
		       as.numeric(netlib("metainfo")["afiro", "optimal_value"])) )
}
