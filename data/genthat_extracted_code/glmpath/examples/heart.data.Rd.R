library(glmpath)


### Name: heart.data
### Title: Dataset for glmpath
### Aliases: heart.data
### Keywords: datasets

### ** Examples

data(heart.data)
attach(heart.data)
fit <- glmpath(x, y, family=binomial)
detach(heart.data)



