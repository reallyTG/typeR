library(tree)


### Name: predict.tree
### Title: Predictions from a Fitted Tree Object
### Aliases: predict.tree
### Keywords: tree

### ** Examples

data(shuttle, package="MASS")
shuttle.tr <- tree(use ~ ., shuttle, subset=1:253,
                   mindev=1e-6, minsize=2)
shuttle.tr
shuttle1 <- shuttle[254:256, ]  # 3 missing cases
predict(shuttle.tr, shuttle1)



