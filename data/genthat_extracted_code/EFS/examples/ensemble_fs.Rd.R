library(EFS)


### Name: ensemble_fs
### Title: Ensemble Feature Selection
### Aliases: ensemble_fs

### ** Examples

 ## Loading dataset in environment
 data(efsdata)
 ## Generate a ranking based on importance (with default NA_threshold = 0.2,
 ## cor_threshold = 0.7, selection = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE))
 efs <- ensemble_fs(efsdata, 5, runs=2)



