if (spaMM.getOption("example_maxtime")>(13.7+24)) { ## user time + system.time for parallele setup
  cat("test LRT with bootstrap, parallel or not:\n")
  data("salamander")
  fullfit <-HLfit(cbind(Mate,1-Mate)~TypeF+(1|Female)+(1|Male),family=binomial(),data=salamander,
                  HLmethod="ML",control.HLfit = list(LevenbergM=FALSE))
  nullfit <-HLfit(cbind(Mate,1-Mate)~1+(1|Female)+(1|Male),family=binomial(),data=salamander,
                  HLmethod="ML",control.HLfit = list(LevenbergM=FALSE))
  set.seed(123)
  pv1 <- LRT(nullfit,fullfit,boot.repl=10)$BartBootLRT$p_value
  set.seed(123)
  pv3 <- LRT(nullfit,fullfit,boot.repl=10,nb_cores=2)$BartBootLRT$p_value
  testthat::expect_equal(pv1,pv3,tolerance=1e-6)
} else cat("test LRT with bootstrap, parallel or not: increase example_maxtime (38s) to run this test.\n")

if (spaMM.getOption("example_maxtime")>18) { ## user time + system.time for parallele setup
  cat("test spaMM_boot() with different backends:\n")
  data("blackcap")
  
  # Generate fits of null and full models:
  lrt <- fixedLRT(null.formula=migStatus ~ 1 + Matern(1|latitude+longitude),
                  formula=migStatus ~ means + Matern(1|latitude+longitude), 
                  HLmethod='ML',data=blackcap)
  
  myfun <- function(y, what=NULL, lrt, ...) { 
    data <- lrt$fullfit$data
    data$migStatus <- y ## replaces original response (! more complicated for binomial fits)
    full_call <- getCall(lrt$fullfit) ## call for full fit
    full_call$data <- data
    res <- eval(full_call) ## fits the full model on the simulated response
    if (!is.null(what)) res <- eval(what)
    return(res) ## the fit, or anything produced by evaluating 'what'
  }

  ## nb_cores=1, serial pbapply 
  spaMM_boot(lrt$nullfit, simuland = myfun, nsim=4,
             what=quote(fixef(res)[2L]), lrt=lrt,nb_cores=1L)[["bootreps"]]    
  
  ## foreach+doSNOW
  if (file.exists((privtest <- "C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests_other_pack/test-doSNOW.R"))) {
    source(privtest)
  } # i.e.: 
  # library("doSNOW")
  # spaMM_boot(lrt$nullfit, simuland = myfun, nsim=4,
  #            what=quote(fixef(res)[2L]), lrt=lrt,nb_cores=4L)[["bootreps"]]
  # unloadNamespace("doSNOW")
  
  ## parallel pbapply 
  if (exists("res")) rm(res) ## otherwise any error in the following code may result in a confusing message
  spaMM_boot(lrt$nullfit, simuland = myfun, nsim=4, control.foreach = list(.errorhandling="pass"),
             what=quote(fixef(res)[2L]), lrt=lrt,nb_cores=4L)[["bootreps"]]    
  
} 

