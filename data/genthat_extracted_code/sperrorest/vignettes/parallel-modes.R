## ---- eval = FALSE-------------------------------------------------------
#  library(future)
#  registerDoFuture()
#  
#  plan("sequential") # sequential
#  plan("multicore") # parallel (Unix only)
#  plan("multisession") # parallel
#  plan("multiprocess") # parallel
#  plan("cluster") # parallel

## ---- eval = FALSE-------------------------------------------------------
#  data(ecuador)
#  fo <- slides ~ dem + slope + hcurv + vcurv + log.carea + cslope
#  
#  sperrorest(data = ecuador, formula = fo,
#             model_fun = glm, model_args = list(family = "binomial"),
#             pred_args = list(type = "response"),
#             smp_fun = partition_cv,
#             smp_args = list(repetition = 1:100, nfold = 5),
#             par_args = list(par_mode = "foreach", par_units = 20),
#             benchmark = TRUE, progress = FALSE,
#             importance = TRUE, imp_permutations = 100)

