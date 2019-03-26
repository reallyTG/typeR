library(gnm)


### Name: termPredictors
### Title: Extract Term Contributions to Predictor
### Aliases: termPredictors
### Keywords: models regression

### ** Examples

## Linear model
G <- gl(4, 6)
x <- 1:24
y <- rnorm(24, 0, 1)
lmGx <- lm(y ~ G + x)
contrib <- termPredictors(lmGx)
contrib
all.equal(as.numeric(rowSums(contrib)), as.numeric(lmGx$fitted)) #TRUE

## Generalized linear model
y <- cbind(rbinom(24, 10, 0.5), rep(10, 24))
glmGx <- glm(y ~ G + x, family = binomial)
contrib <- termPredictors(glmGx)
contrib
all.equal(as.numeric(rowSums(contrib)),
          as.numeric(glmGx$linear.predictors)) #TRUE

## Generalized nonlinear model
A <- gl(4, 6)
B <- gl(6, 1, 24)
y <- cbind(rbinom(24, 10, 0.5), rep(10, 24))
set.seed(1)
gnmAB <- gnm(y ~ A + B + Mult(A, B), family = binomial)
contrib <- termPredictors(gnmAB)
contrib
all.equal(as.numeric(rowSums(contrib)),
          as.numeric(gnmAB$predictors)) #TRUE



