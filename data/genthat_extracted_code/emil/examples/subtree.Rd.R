library(emil)


### Name: subtree
### Title: Extract a subset of a tree of nested lists
### Aliases: subtree

### ** Examples

l <- list(A=list(a=0:2, b=3:4, c=023-22030),
          B=list(a=5:7, b=8:9))
subtree(l, 1:2, "b")
subtree(l, TRUE, mean, "a")

# More practical examples
x <- iris[-5]
y <- iris$Species
cv <- resample("crossvalidation", y, nfold=5, nrep=3)
procedure <- modeling_procedure("pamr")

# To illustrate the error handling capacities of subtree we'll introduce some
# spurious errors in the pre-processing function. By setting .return_error=TRUE
# they wont break the execution, but will instead be return in the results.
pre_error <- function(data, risk=.1){
    if(runif(1) < risk)
        stop("Oh no! Random error!")
    data
}
result <- evaluate(procedure, x, y, resample=cv,
    .save=c(importance=TRUE), .return_error=TRUE,
    pre_process = function(...){
        pre_split(...) %>%
            pre_error(risk=.3) %>%
            pre_pamr
    }
)
message(sum(sapply(result, inherits, "error")),
        " folds did not complete successfully!")

# Extract error rates. Since some folds fail it will be an ugly list with both
# numeric estimates and NULL values (for the failed folds).
subtree(result, TRUE, "error")

# To put it on a more consistent form we can impute the missing error rates
# with NA to allow automatic simplification into a vector (since it requires
# all values to be on the same form, i.e. numeric(1) rather than a mix
# between numeric(1) and NULL as in the previous example).
subtree(result, TRUE, "error", error_value=as.numeric(NA), warn=-1)

# Sum up feature importance for all classes within each fold and extract.
# Note that the lengths (= 4) must match between the folds for the automatic
# simplification to work.
subtree(result, TRUE, "importance", function(x){
    if(is.null(x)){
        rep(NA, 3)
    } else {
        colMeans(x[2:4])
    }
})

# The equivalent 'select' command would be ...
require(tidyr)
imp <- result %>% select(fold = TRUE, "importance", function(x){
    if(is.null(x)) return(NULL)
    x %>% gather(Species, Importance, -feature)
})
require(ggplot2)
ggplot(imp, aes(x=Species, y=Importance)) +
    geom_abline(intercept=0, slope=0, color="hotpink") +
    geom_boxplot() + facet_wrap(~feature)




