## ----insert_fun, echo = FALSE--------------------------------------------
library(knitr)
library(pinbasic)
library(formatR)

insert_fun = function(name, env = parent.frame()) {
  read_chunk(lines = capture.output(dump(name, '', envir = env)), labels = paste(name, 'source', sep = '-'))
}

knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----pinll, code = formatR::usage(pin_ll), eval = FALSE------------------
#  pin_ll(param = NULL, numbuys = NULL, numsells = NULL,
#      factorization = "Lin_Ke")

## ----initialvals, code = formatR::usage(initial_vals), eval = FALSE------
#  initial_vals(numbuys = NULL, numsells = NULL, method = "HAC", length = 5,
#      num_clust = 5, details = FALSE)

## ----dataloading---------------------------------------------------------
data("BSinfrequent")
data("BSfrequent")
data("BSfrequent2015")
data("BSheavy")

summary(BSinfrequent)
summary(BSfrequent)
summary(BSfrequent2015)
summary(BSheavy)

## ----pinest, eval = FALSE------------------------------------------------
#  # using default values for lower and upper bounds
#  # confidence interval computation enabled
#  pin_bsheavy <- pin_est(numbuys = BSheavy[,"Buys"],
#                         numsells = BSheavy[,"Sells"],
#                         confint = TRUE, ci_control = list(n = 1000, seed = 123),
#                         posterior = TRUE)

## ----loadpinest, echo = FALSE--------------------------------------------
pin_bsheavy <- readRDS("../RDSfiles/pin_bsheavy.rds")

## ----strpinheavy---------------------------------------------------------
# structure of returned list
str(pin_bsheavy)

# convert matrix to data.frame for prettier output in the vignette
as.data.frame(pin_bsheavy$Results)

## ----qpin----------------------------------------------------------------
# dates stored in rownames of dataset
head(rownames(BSfrequent2015))

## ----qpin2015, eval = FALSE----------------------------------------------
#  # quarterly PIN estimates
#  # confidence interval computation enabled:
#  #   * using only 1000 simulated datasets
#  #   * confidence level set to 0.9
#  #   * seed set to 287
#  
#  qpin2015 <- qpin(numbuys = BSfrequent2015[,"Buys"],
#                   numsells = BSfrequent2015[,"Sells"],
#                   dates = as.Date(rownames(BSfrequent2015), format = "%Y-%m-%d"),
#                   confint = TRUE, ci_control = list(n = 1000, level = 0.9, seed = 287))

## ----qpin2015rds, echo = FALSE-------------------------------------------
qpin2015 <- readRDS("../RDSfiles/qpin2015.rds")

## ----qpin2015sum---------------------------------------------------------
# list of length 4 is returned
names(qpin2015[["res"]])

# confidence intervals for all four quarters
ci_quarters <- lapply(qpin2015[["res"]], function(x) x$confint)
ci_quarters

# each list element has the same structure as results from pin_est function
# convert matrices to data.frames for prettier output in the vignette
qpin2015_res <- lapply(qpin2015[["res"]], function(x) as.data.frame(x$Results))

qpin2015_res[[1]]
qpin2015_res[[4]]

## ------------------------------------------------------------------------
library(ggplot2)
ggplot(qpin2015[["res"]])

## ----simBS---------------------------------------------------------------
# getting the estimates
heavy_est <- pin_bsheavy$Results[,"Estimate"]

# simulate buys and sells data
set.seed(123)
sim_heavy <- simulateBS(param = heavy_est, ndays = 100)

# summary of simulated data
summary(sim_heavy)

## ----confint1, eval = FALSE----------------------------------------------
#  # n = 10000 simulation runs,
#  # level = 0.95 (confidence level)
#  
#  system.time(heavy_ci <- pin_confint(param = heavy_est,
#                                      numbuys = sim_heavy[,"Buys"],
#                                      numsells = sim_heavy[,"Sells"],
#                                      seed = 321, ncores = 1))

## ----confintsystime1, echo = FALSE---------------------------------------
systime1 <- readRDS("../RDSfiles/systimeci1.rds")
heavy_ci <- readRDS("../RDSfiles/ci1.rds")
systime1

## ----confint4, eval = FALSE----------------------------------------------
#  # same setting but 4 cpu cores
#  system.time(heavy_ci4 <- pin_confint(param = heavy_est,
#                                       numbuys = sim_heavy[,"Buys"],
#                                       numsells = sim_heavy[,"Sells"],
#                                       seed = 321, ncores = 4))

## ----confintsystime4, echo = FALSE---------------------------------------
systime4 <- readRDS("../RDSfiles/systimeci4.rds")
heavy_ci4 <- readRDS("../RDSfiles/ci4.rds")
systime4

## ----compare-------------------------------------------------------------
heavy_ci
heavy_ci4

## ----post----------------------------------------------------------------
# Calculating posterior probabilities
post_heavy <- posterior(param = heavy_est,
                        numbuys = BSheavy[,"Buys"], numsells = BSheavy[,"Sells"])

# Plotting                        
ggplot(post_heavy)

## ----postdates-----------------------------------------------------------
# Corresponding parameter estimates
freq_2015.3 <- qpin2015[["res"]]$'2015.3'$Results[,"Estimate"]

# Subsetting data
third_quarter <- subset(BSfrequent2015, subset = lubridate::quarter(rownames(BSfrequent2015)) == 3)

# Calculating posterior probabilities
post_third <- posterior(param = freq_2015.3, 
                        numbuys = third_quarter[,"Buys"], numsells = third_quarter[,"Sells"])

# Plotting
ggplot(post_third)

