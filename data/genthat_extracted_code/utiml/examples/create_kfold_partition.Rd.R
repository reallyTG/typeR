library(utiml)


### Name: create_kfold_partition
### Title: Create the k-folds partition based on the specified algorithm
### Aliases: create_kfold_partition

### ** Examples

k10 <- create_kfold_partition(toyml, 10)
k5 <- create_kfold_partition(toyml, 5, "stratified")

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
k3 <- create_kfold_partition(toyml, 3, "sequencial_split")



