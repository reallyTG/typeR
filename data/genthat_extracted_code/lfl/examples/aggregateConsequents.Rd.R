library(lfl)


### Name: aggregateConsequents
### Title: Implicational aggregation of rules' consequents into a fuzzy set
### Aliases: aggregateConsequents
### Keywords: models robust

### ** Examples

    # create a partition matrix
    partition <- matrix(c(0:10/10, 10:0/10, rep(0, 5),
                          rep(0, 5), 0:10/10, 10:0/10,
                          0:12/12, 1, 12:0/12),
                        byrow=FALSE,
                        ncol=3)
    colnames(partition) <- c('a', 'b', 'c')

    # the result of aggregation is equal to:
    # pmin(1, partition[, 1] + (1 - 0.5), partition[, 2] + (1 - 0.8))
    aggregateConsequents(c('a', 'b'), c(0.5, 0.8), partition)



