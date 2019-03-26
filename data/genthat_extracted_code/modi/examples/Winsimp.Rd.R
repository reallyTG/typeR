library(modi)


### Name: Winsimp
### Title: Winsorization followed by imputation
### Aliases: Winsimp

### ** Examples

data(bushfirem, bushfire.weights)
det.res <- TRC(bushfirem, weight = bushfire.weights)
imp.res <- Winsimp(bushfirem, det.res$output$center, det.res$output$scatter, det.res$outind)
print(imp.res$output)



