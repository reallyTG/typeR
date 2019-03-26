library(misclassGLM)


### Name: misclassMlogit
### Title: Mlogit estimation under misclassified covariate
### Aliases: misclassMlogit

### ** Examples

## simulate data
## No test: 
data <- simulate_mlogit_dataset()
## End(No test)

## estimate model without misclassification error
## No test: 
library(mlogit)
data2 <- mlogit.data(data, varying = NULL, choice = "Y", shape = "wide")
summary(mlogit(Y ~ 1 | X + M2, data2, reflevel = "3"))
## End(No test)

## estimate model with misclassification error
## No test: 
summary(mlogit(Y ~ 1 | X + M, data2, reflevel = "3"))
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
Yneu <- matrix(rep.int(0, nrow(data) * 3), ncol = 3)
for (i in 1:nrow(data)) Yneu[i, data$Y[i]] <- 1
est <- misclassMlogit(Y = Yneu,
                      X = as.matrix(data[, 2, drop = FALSE]),
                      setM = matrix(c(0, 1), nrow = 2),
                      P = P)
summary(est)
## End(No test)

## and bootstrapping the results from dataset
## Not run: 
##D summary(boot.misclassMlogit(est,
##D                          Y = Yneu,
##D                          X = data.matrix(data[, 2, drop = FALSE]),
##D                          Pmodel = Pmodel,
##D                          PX = data,
##D                          repetitions = 100))
## End(Not run)




