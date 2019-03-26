library(EFS)


### Name: efs_eval
### Title: Evaluation of Ensemble Features Selection
### Aliases: efs_eval

### ** Examples

 ## Loading dataset in environment
 data(efsdata)
 ## Generate a ranking based on importance (with default
 ## NA_threshold = 0.7,cor_threshold = 0.2)
 efs<-ensemble_fs(efsdata,5,runs=2)
 ## Conduct AUC test and permutation test
 eval_example <- efs_eval(data = efsdata, efs_table = efs, file_name = 'eval_test', 
                      classnumber = 5, NA_threshold = 0.2,
                      logreg = TRUE,
                      rf = FALSE,
                      permutation = TRUE, p_num = 2, 
                      variances = FALSE, jaccard = FALSE)
## Calculating variances and the Jaccard-index can take several minutes computation time 



