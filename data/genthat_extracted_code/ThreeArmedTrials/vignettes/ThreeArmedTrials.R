## ------------------------------------------------------------------------
w <- ThreeArmedTrials::opt_alloc_RET(experiment = 0.5, 
                                     reference = 0.3, 
                                     placebo = 0.2, 
                                     Delta = 0.8, 
                                     distribution = "binary", 
                                     h = function(x){-log(x/(1-x))})

## ------------------------------------------------------------------------
print(w)

## ------------------------------------------------------------------------
ThreeArmedTrials::power_RET(experiment = 0.5, reference = 0.3, placebo = 0.2,
                            Delta = 0.8,
                            sig_level = 0.025,
                            power = 0.8,
                            allocation = w,
                            distribution = "binary",
                            h = function(x){-log(x/(1-x))},
                            h_inv = function(x){exp(-x)/(1+exp(-x))},
                            var_estimation = "RML")

## ------------------------------------------------------------------------
library(ThreeArmedTrials)
noninf_test <- ThreeArmedTrials::test_RET(xExp = remission$experimental, 
                                          xRef = remission$reference, 
                                          xPla = remission$placebo, 
                                          Delta = 0.8, 
                                          var_estimation = "RML",
                                          distribution = "binary",
                                          h = function(x){-log(x/(1-x))},
                                          h_inv = function(x){exp(-x)/(1+exp(-x))})


## ------------------------------------------------------------------------
print(noninf_test)

## ------------------------------------------------------------------------
library(ThreeArmedTrials)
power_RET(experiment = 15, reference = 17, placebo = 20, 
          Delta = 0.8, sig_level = 0.025, power = 0.8, 
          allocation = c(1, 1, 1) / 3, 
          var_estimation = "RML", 
          distribution = "poisson")

## ------------------------------------------------------------------------
opt_alloc_RET(experiment = 15, 
              reference = 17, 
              placebo = 20, 
              Delta = 0.8,  
              distribution = "poisson")

## ---- results = 'asis', echo = FALSE-------------------------------------
data(seizures)
knitr::kable(head(seizures), caption = "First six entries of seizures dataset", row.names = TRUE)

## ------------------------------------------------------------------------
noninf_test <- ThreeArmedTrials::test_RET(xExp = seizures$exp, 
                                          xRef = seizures$ref, 
                                          xPla = seizures$pla, 
                                          Delta = 0.8, 
                                          var_estimation = "RML",
                                          distribution = "poisson")

## ------------------------------------------------------------------------
print(noninf_test)

## ---- results = 'asis', echo = FALSE-------------------------------------
data(GElesions)
knitr::kable(head(GElesions), caption = "First six entries of GElesions dataset", row.names = TRUE)

## ------------------------------------------------------------------------
set.seed(12345)
noninf_test <- ThreeArmedTrials::test_RET(xExp = GElesions$experimental, 
                                          xRef = GElesions$reference, 
                                          xPla = GElesions$placebo, 
                                          Delta = 0.8, 
                                          n_perm = 50000,
                                          distribution = "nonparametric")

## ------------------------------------------------------------------------
print(noninf_test)

