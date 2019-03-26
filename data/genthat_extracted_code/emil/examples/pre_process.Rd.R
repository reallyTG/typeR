library(emil)


### Name: pre_process
### Title: Data preprocessing
### Aliases: pre_process pre_split pre_convert pre_transpose pre_remove
###   pre_center pre_scale pre_remove_constant pre_remove_correlated
###   pre_pca

### ** Examples

# Setup an example to work on
x <- as.matrix(iris[-5])
x[sample(600, 6)] <- NA
y <- iris$Species
cv <- resample("crossvalidation", y, nrepeat=3, nfold=4)
procedure <- modeling_procedure("lda")

# Simple dataset splitting
sets <- pre_split(x, y, cv[[1]])

# Chaining using the pipe operator
sets <- pre_split(x, y, cv[[1]]) %>%
    pre_impute_median %>%
    pre_scale

# Integration with `evaluate`
result <- evaluate(procedure, x, y, resample=cv,
    pre_process = function(...){
        pre_split(...) %>%
        pre_impute_median %>%
        pre_scale
    }
)

# or analogously with a list
result <- evaluate(procedure, x, y, resample=cv,
    pre_process = list(pre_split, pre_impute_median, pre_scale))

# Imputing without splitting
x.imputed <- impute_knn(x)

# Using a whole chain without splitting
x.processed <- pre_split(x, y=NULL) %>%
    pre_impute_median %>%
    pre_scale %>%
    (function(data) data$fit$x)




