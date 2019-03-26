library(modi)


### Name: POEM
### Title: Nearest Neighbour Imputation with Mahalanobis distance
### Aliases: POEM

### ** Examples

data(bushfirem, bushfire.weights)
outliers <- rep(0, nrow(bushfirem))
outliers[31:38] <- 1
imp.res <- POEM(bushfirem, bushfire.weights, outliers,
preliminary.mean.imputation = TRUE)
print(imp.res$output)
var(imp.res$imputed.data)



