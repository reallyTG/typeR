library(EFS)


### Name: barplot_fs
### Title: Visualization of 'ensemble_fs' in barplot
### Aliases: barplot_fs

### ** Examples

 ## Loading dataset in environment
 data(efsdata)
 ## Generate a ranking based on inportance (with default
 ## NA_threshold = 0.7,cor_threshold = 0.2)
 efs <- ensemble_fs(efsdata ,5 ,runs=2)
 ## Create a cumulative barplot based on the output from efs 
 barplot_fs("test", efs, order = TRUE)



