library(rda)


### Name: rda.cv
### Title: RDA Cross Validation Function
### Aliases: rda.cv

### ** Examples

data(colon)
colon.x <- t(colon.x)
fit <- rda(colon.x, colon.y)
fit.cv <- rda.cv(fit, x=colon.x, y=colon.y)

## to use the customized folds in cross-validation,
## for example, 6-fold with 11, 11, 10, 10, 10, 10 samples 
## in the respective folds, you can do the follows:
index <- sample(1:62, 62)
folds <- list()
folds[[1]] <- index[1:11]
folds[[2]] <- index[12:22]
folds[[3]] <- index[23:32]
folds[[4]] <- index[33:42]
folds[[5]] <- index[43:52]
folds[[6]] <- index[53:62]
fit.cv <- rda.cv(fit, colon.x, colon.y, folds=folds)



