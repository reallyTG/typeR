library(CrossValidate)

set.seed(723461)
dataset <- matrix(rnorm(50*100), nrow=50)
pseudoclass <- factor(rep(c("A", "B"), each=50))
model <- modelerCCP # obviously, other models can be used
cv <- CrossValidate(model, dataset, pseudoclass, 0.5, 10)
summary(cv)
