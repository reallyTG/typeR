library(phyclust)


### Name: phyclust
### Title: The Main Function of phyclust
### Aliases: phyclust 'Class phyclust'
### Keywords: phyclust

### ** Examples

library(phyclust, quiet = TRUE)

X <- seq.data.toy$org

set.seed(1234)
(ret.1 <- phyclust(X, 3))

EMC.2 <- .EMC
EMC.2$substitution.model <- "HKY85"
# the same as EMC.2 <- .EMControl(substitution.model = "HKY85")

(ret.2 <- phyclust(X, 3, EMC = EMC.2))

# for semi-supervised clustering
semi.label <- rep(0, nrow(X))
semi.label[1:3] <- 1
(ret.3 <- phyclust(X, 3, EMC = EMC.2, label = semi.label))



