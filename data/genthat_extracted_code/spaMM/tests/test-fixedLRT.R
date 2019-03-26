cat("\ntest fixedLRT:\n")
# fixedLRT

data("blackcap")
## result comparable to the corrHLfit examples based on blackcap
set.seed(123)
nb_cores <- 1 ## don't use parallel here (slow for boot.repl=3 ) and may be other 'check' issues
# nb_cores <- parallel::detectCores()-1
fl <- fixedLRT(null.formula=migStatus ~ 1 + Matern(1|latitude+longitude),
         formula=migStatus ~ means + Matern(1|latitude+longitude), 
         HLmethod='ML',data=blackcap,init.corrHLfit=list(phi=1e-6),boot.repl=3,nb_cores=nb_cores) ## phi=1e-6 is a potential test of changes in .calc_inits_dispPars()

testthat::expect_equal(fl$basicLRT$p_value,0.00806473,tolerance=2e-5)
testthat::expect_equal(fl$BartBootLRT$p_value,structure(0.007888223,boot_type="marginal"),tolerance=2e-5) # 
