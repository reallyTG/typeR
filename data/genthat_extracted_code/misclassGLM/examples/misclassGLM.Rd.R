library(misclassGLM)


### Name: misclassGLM
### Title: misclassGLM
### Aliases: misclassGLM misclassGLM-package

### ** Examples

## simulate data
## No test: 
data <- simulate_GLM_dataset()
## End(No test)

## estimate model without misclassification error
## No test: 
summary(lm(Y ~ X + M2, data))
## End(No test)

## estimate model with misclassification error
## No test: 
summary(lm(Y ~ X + M, data))
## End(No test)

## estimate misclassification probabilities
## No test: 
Pmodel <- glm(M2 ~ M + X, data = data, family = binomial("logit"))
summary(Pmodel)
## End(No test)

## construct a-posteriori probabilities from Pmodel
## No test: 
P <- predict(Pmodel, newdata = data, type = "response")
P <- cbind(1 - P, P)
dimnames(P)[[2]] <- c("M0", "M1") ## speaking names
## End(No test)

## estimate misclassGLM
## No test: 
est <- misclassGLM(Y = data$Y,
                   X = as.matrix(data[, 2, drop = FALSE]),
                   setM = matrix(c(0, 1), nrow = 2),
                   P = P)
summary(est)
## End(No test)

## and bootstrapping the results from dataset
## Not run: 
##D   summary(boot.misclassGLM(est,
##D                            Y = data$Y,
##D                            X = data.matrix(data[, 2, drop = FALSE]),
##D                            Pmodel = Pmodel,
##D                            PX = data,
##D                            repetitions = 100))
## End(Not run)




