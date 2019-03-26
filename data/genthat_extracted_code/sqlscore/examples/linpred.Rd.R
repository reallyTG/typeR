library(sqlscore)


### Name: linpred
### Title: Unevaluated prediction expressions for models
### Aliases: linpred

### ** Examples

# A Gaussian GLM including factors
mod <- glm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
           data=datasets::iris)
linpred(mod)

# A binomial GLM - linear predictor is unaffected
mod <- glm(Sepal.Length > 5.0 ~ Sepal.Width + Petal.Length + Petal.Width + Species,
           data=datasets::iris, family=binomial("logit"))
linpred(mod)

#With formula operators
x <- matrix(rnorm(100*20),100,20)
colnames(x) <- sapply(1:20, function(x) paste0("X", as.character(x)))
x <- as.data.frame(x)
mod <- glm(X2 ~ X3 + X5 + X15*X8, data=x)
linpred(mod)




