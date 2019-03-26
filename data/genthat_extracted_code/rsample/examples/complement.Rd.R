library(rsample)


### Name: complement
### Title: Determine the Assessment Samples
### Aliases: complement

### ** Examples

set.seed(28432)
fold_rs <- vfold_cv(mtcars)
head(fold_rs$splits[[1]]$in_id)
fold_rs$splits[[1]]$out_id
complement(fold_rs$splits[[1]])



