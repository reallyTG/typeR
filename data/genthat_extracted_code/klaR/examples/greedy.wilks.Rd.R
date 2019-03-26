library(klaR)


### Name: greedy.wilks
### Title: Stepwise forward variable selection for classification
### Aliases: greedy.wilks greedy.wilks.default greedy.wilks.formula
###   print.greedy.wilks
### Keywords: multivariate

### ** Examples

data(B3)
gw_obj <- greedy.wilks(PHASEN ~ ., data = B3, niveau = 0.1)
gw_obj
## now you can say stuff like
## lda(gw_obj$formula, data = B3)



