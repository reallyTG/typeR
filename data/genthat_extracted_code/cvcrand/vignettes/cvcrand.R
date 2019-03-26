## ----setup,echo=FALSE,results="hide"-------------------------------------

library(cvcrand)



## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(Dickinson_design[ , 1:6])

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(Dickinson_design[ , 7:11])

## ----cvcrand, fig.keep="all", fig.width = 7, fig.height=4----------------

 Design_result <- cvcrand(clustername = Dickinson_design$county,
                  balancemetric = "l2",
                  x = data.frame(Dickinson_design[ , c("location", "inciis",
                      "uptodateonimmunizations", "hispanic", "incomecat")]),
                  ntotal_cluster = 16,
                  ntrt_cluster = 8,
                  categorical = c("location", "incomecat"),
                  savedata = "dickinson_constrained.csv",
                  savebscores = "dickinson_bscores.csv",
                  cutoff = 0.1,
                  seed = 12345)
 
 



## ----set-options, echo=FALSE, fig.keep="all", fig.width = 7, fig.height=4-------------------------
options(width = 100)
 

## ---- fig.keep="all", fig.width = 7, fig.height=4-------------------------------------------------
 # the balance metric used
 Design_result$balancemetric

 # the allocation scheme from constrained randomization
 Design_result$allocation
 
 # the histogram of the balance score with respect to the balance metric
 Design_result$bscores
 
 # the statement about how many clusters to be randomized to the intervention and the control arms respectively
 Design_result$assignment_message
 
 # the statement about how to get the whole randomization space to use in constrained randomization
 Design_result$scheme_message
 
 # the statement about the cutoff in the constrained space
 Design_result$cutoff_message
 
 # the statement about the selected scheme from constrained randomization
 Design_result$choice_message
 
 
 # the data frame containing the allocation scheme, the clustername as well as the original data frame of covariates
 Design_result$data_CR
 
 # the descriptive statistics for all the variables by the two arms from the selected scheme
 Design_result$baseline_table



## ----cvcrandst1, fig.keep="all", fig.width = 7, fig.height=4--------------------------------------
# Stratification on location, with constrained randomization on other specified covariates

Design_stratified_result1 <- cvcrand(clustername = Dickinson_design$county,
                                     balancemetric = "l2",
                                     x = data.frame(Dickinson_design[ , c("location", "inciis", 
                                                                          "uptodateonimmunizations", 
                                                                          "hispanic", "incomecat")]),
                                     ntotal_cluster = 16,
                                     ntrt_cluster = 8,
                                     categorical = c("location", "incomecat"),
                                     weights = c(1000, 1, 1, 1, 1),
                                     cutoff = 0.1,
                                     seed = 12345) 


## ---- fig.keep="all", fig.width = 7, fig.height=4-------------------------------------------------
Design_stratified_result1$baseline_table


## ----cvcrandst2, fig.keep="all", fig.width = 7, fig.height=4--------------------------------------
# An alternative and equivalent way to stratify on location

Design_stratified_result2 <- cvcrand(clustername = Dickinson_design$county,
                                     balancemetric = "l2",
                                     x = data.frame(Dickinson_design[ , c("location", "inciis",
                                                                          "uptodateonimmunizations", 
                                                                          "hispanic", "incomecat")]),
                                     ntotal_cluster = 16,
                                     ntrt_cluster = 8,
                                     categorical = c("location", "incomecat"),
                                     stratify = "location",
                                     cutoff = 0.1,
                                     seed = 12345)


## ---- fig.keep="all", fig.width = 7, fig.height=4-------------------------------------------------
Design_stratified_result2$baseline_table


## ---- echo=FALSE, results='asis'------------------------------------------------------------------
knitr::kable(head(Dickinson_outcome, 10))

## ----cptest, fig.keep="all", fig.width = 7, fig.height=4------------------------------------------
 Analysis_result <- cptest(outcome = Dickinson_outcome$outcome,
                           clustername = Dickinson_outcome$county,
                           z = data.frame(Dickinson_outcome[ , c("location", "inciis",
                               "uptodateonimmunizations", "hispanic", "incomecat")]), 
                            cspacedatname = system.file("dickinson_constrained.csv", package = "cvcrand"),                                 
                           outcometype = "binary",                                                      
                           categorical = c("location","incomecat"))



## ----cptestre, fig.keep="all", fig.width = 7, fig.height=4----------------------------------------
 Analysis_result 

## ----info, results='markup', echo=FALSE-----------------------------------------------------------
sessionInfo()

