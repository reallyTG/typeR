## ---- eval = FALSE-------------------------------------------------------
#  library(bhrcr)
#  # If you don't bother to see the step-by-step interactive
#  # process of PCE estimation and generating plots
#  # please set "ask = F".
#  demo(fastExample, ask = F)
#  # or we can run the slowExample.
#  # to save your time, we have already run the MCMC in the slow example for you.
#  # the demo will show you the saved results.
#  demo(slowExample, ask = F)

## ----usage, eval = FALSE-------------------------------------------------
#  out <- clearanceEstimatorBayes(data = data, covariates=covariates,
#         seed=1234, detect.limit=40, outlier.detect = TRUE, conf.level=.95,
#         niteration = 100000, burnin = 500, thin = 50,
#         filename = "output.csv")

## ----summary, eval = FALSE-----------------------------------------------
#  library(bhrcr)
#  data(pursat)
#  data(pursat_covariates)
#  results <- clearanceEstimatorBayes(data = pursat,
#             covariates = pursat_covariates, seed = 1234,
#             detect.limit = 15, burnin=50, niteration=100, thin=10)
#  summary(results)

## ----summary result, eval = FALSE----------------------------------------
#  Summary:
#  
#  clearanceEstimatorBayes(data = pursat, covariates = pursat_covariates,
#      seed = 1234, detect.limit = 15, niteration = 100, burnin = 50, thin = 10)
#  
#  Posterior Estimates and Intervals for the Effect of Covariates on log half-lives
#  
#                 Mean  Median  CI 2.5% CI 97.5%
#  (Intercept)   1.1371  1.2486  0.3096   1.7616
#  SexM          0.1648  0.1508  0.0755   0.3060
#  agegroup21+  -0.0002  0.0163 -0.0674   0.0866
#  vvkvTRUE     -0.0227 -0.0295 -0.0985   0.0567
#  HbE           0.0898  0.0961 -0.0201   0.2017
#  athal        -0.0348 -0.0608 -0.1263   0.1307
#  g6pd         -0.0168 -0.0222 -0.0814   0.0579
#  lnPf0         0.0356  0.0175 -0.0140   0.1162
#  year2010TRUE  0.0465  0.0488 -0.0306   0.1213
#  group         0.1532  0.1522  0.0734   0.2418
#  ---
#  Detect Limit:  15 , Log Base:  2.718

## ----diagnostics, eval = FALSE-------------------------------------------
#  # We use the results given by our previous example
#  # All diagnostic plots are saved under "./mcmcDiagnostics"
#  diagnostics(results)

## ----slowExample, eval = FALSE-------------------------------------------
#  demo(slowExample, ask = F)

## ----plot, eval = FALSE--------------------------------------------------
#  # All plots are saved under "./plots"
#  plot(results)

## ----patient1, echo = FALSE, fig.align = "center"------------------------
knitr::include_graphics("./figures/patient_1.pdf")

## ----patient81, echo = FALSE, fig.align = "center"-----------------------
knitr::include_graphics("./figures/patient_81.pdf")

## ---- eval = FALSE-------------------------------------------------------
#  # Example: Patient 1, 3, 14, 35
#  id <- c(1, 3, 14, 35)
#  a <- .025
#  results$clearance.mean[id]
#  [1] 0.10762175 0.08054074 0.08373204 0.11575772
#  
#  results$clearance.median[id]
#  [1] 0.10802284 0.08176813 0.08487102 0.11725616
#  
#  # If we want to check several patient's profiles simultaneously
#  CI <- apply(results$clearance.post[id, ], 1, quantile, probs=c(a, 1-a))
#  colnames(CI) <- id
#  CI
#                 1          3         14        35
#  2.5%  0.1005186 0.07273923 0.07624411 0.09641293
#  97.5% 0.1167284 0.08816739 0.08975329 0.13476679
#  
#  # If we want to check only one patient's CI, for example patient id = 1
#  id <- 1
#  quantile(results$clearance.post[id, ], c(a, 1-a))
#       2.5%     97.5%
#  0.1005186 0.1167284

## ---- eval = FALSE-------------------------------------------------------
#  # Here we focus on patient with id 1
#  # The output is a vector of posterior samples of changepoint time
#  # We display it in two rows here
#  results$changelag.post[id, ]
#  [1] 0.000000 0.000000 10.036735 1.831670 0.000000
#  [5] 4.633040 1.847377 0.000000  0.000000 7.982357

## ---- eval = FALSE-------------------------------------------------------
#  # id <- 81
#  results$changetail.post[id, ]
#  [1] 84 84 84 84 84 84 84 84 84 84

## ---- eval = FALSE-------------------------------------------------------
#  results$lag.median[id]
#  [1] 24.8569

## ---- eval = FALSE-------------------------------------------------------
#  quantile(results$changelag.post[id, ], c(0.025, 0.975))
#      2.5%     97.5%
#  8.337287 28.843629

