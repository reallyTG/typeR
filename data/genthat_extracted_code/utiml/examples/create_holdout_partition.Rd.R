library(utiml)


### Name: create_holdout_partition
### Title: Create a holdout partition based on the specified algorithm
### Aliases: create_holdout_partition

### ** Examples

dataset <- create_holdout_partition(toyml)
names(dataset)
## [1] "train" "test"
#dataset$train
#dataset$test

dataset <- create_holdout_partition(toyml, c(a=0.1, b=0.2, c=0.3, d=0.4))
#' names(dataset)
#' ## [1] "a" "b" "c" "d"

sequencial_split <- function (mdata, r) {
 S <- list()

 amount <- trunc(r * mdata$measures$num.instances)
 indexes <- c(0, cumsum(amount))
 indexes[length(r)+1] <- mdata$measures$num.instances

 S <- lapply(seq(length(r)), function (i) {
   seq(indexes[i]+1, indexes[i+1])
 })

 S
}
dataset <- create_holdout_partition(toyml, method="sequencial_split")



