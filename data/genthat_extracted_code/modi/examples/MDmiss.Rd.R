library(modi)


### Name: MDmiss
### Title: Mahalanobis distance (MD) for data with missing values
### Aliases: MDmiss

### ** Examples

data(bushfirem, bushfire)
MDmiss(bushfirem, apply(bushfire, 2, mean), var(bushfire))



