library(intubate)


### Name: ipred
### Title: Interfaces for ipred package for data science pipelines.
### Aliases: ntbt_bagging ntbt_errorest ntbt_inbagg ntbt_inclass ntbt_slda
### Keywords: intubate magrittr ipred bagging errorest inbagg inclass slda

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(ipred)
##D 
##D ## ntbt_bagging: Bagging Classification, Regression and Survival Trees
##D data("BreastCancer", package = "mlbench")
##D 
##D ## Original function to interface
##D bagging(Class ~ Cl.thickness + Cell.size + Cell.shape + Marg.adhesion + Epith.c.size
##D         + Bare.nuclei + Bl.cromatin + Normal.nucleoli + Mitoses, data=BreastCancer, coob=TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bagging(BreastCancer, 
##D              Class ~ Cl.thickness + Cell.size + Cell.shape + Marg.adhesion + Epith.c.size
##D              + Bare.nuclei + Bl.cromatin + Normal.nucleoli + Mitoses, coob=TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D BreastCancer %>%
##D   ntbt_bagging(Class ~ Cl.thickness + Cell.size + Cell.shape + Marg.adhesion + Epith.c.size
##D                + Bare.nuclei + Bl.cromatin + Normal.nucleoli + Mitoses, coob=TRUE)
##D 
##D 
##D ## ntbt_errorest: Estimators of Prediction Error
##D data("iris")
##D library("MASS")
##D mypredict.lda <- function(object, newdata)
##D   predict(object, newdata = newdata)$class
##D 
##D ## Original function to interface
##D errorest(Species ~ ., data = iris, model = lda, estimator = "cv", predict = mypredict.lda)
##D 
##D ## The interface puts data as first parameter
##D ntbt_errorest(iris, Species ~ ., model = lda, estimator = "cv", predict = mypredict.lda)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_errorest(Species ~ ., model = lda, estimator = "cv", predict = mypredict.lda)
##D 
##D 
##D ## ntbt_inbagg: Indirect Bagging
##D library("MASS")
##D library("rpart")
##D y <- as.factor(sample(1:2, 100, replace = TRUE))
##D W <- mvrnorm(n = 200, mu = rep(0, 3), Sigma = diag(3))
##D X <- mvrnorm(n = 200, mu = rep(2, 3), Sigma = diag(3))
##D colnames(W) <- c("w1", "w2", "w3")
##D colnames(X) <- c("x1", "x2", "x3")
##D DATA <- data.frame(y, W, X)
##D pFUN <- list(list(formula = w1~x1+x2, model = lm, predict = mypredict.lm),
##D list(model = rpart))
##D 
##D ## Original function to interface
##D inbagg(y ~ w1 + w2 + w3 ~ x1 + x2 + x3, data = DATA, pFUN = pFUN)
##D 
##D ## The interface puts data as first parameter
##D ntbt_inbagg(DATA, y ~ w1 + w2 + w3 ~ x1 + x2 + x3, pFUN = pFUN)
##D 
##D ## so it can be used easily in a pipeline.
##D DATA %>%
##D   ntbt_inbagg(y ~ w1 + w2 + w3 ~ x1 + x2 + x3, pFUN = pFUN)
##D 
##D 
##D ## ntbt_inclass: Indirect Classification
##D data("Smoking", package = "ipred")
##D # Set three groups of variables:
##D # 1) explanatory variables are: TarY, NicY, COY, Sex, Age
##D # 2) intermediate variables are: TVPS, BPNL, COHB
##D # 3) response (resp) is defined by:
##D classify <- function(data) {
##D   data <- data[,c("TVPS", "BPNL", "COHB")]
##D   res <- t(t(data) > c(4438, 232.5, 58))
##D   res <- as.factor(ifelse(apply(res, 1, sum) > 2, 1, 0))
##D   res
##D }
##D response <- classify(Smoking[ ,c("TVPS", "BPNL", "COHB")])
##D smoking <- data.frame(Smoking, response)
##D 
##D ## Original function to interface
##D inclass(response ~ TVPS + BPNL + COHB ~ TarY + NicY + COY + Sex + Age, data = smoking,
##D         pFUN = list(list(model = lm, predict = mypredict.lm)), cFUN = classify)
##D 
##D ## The interface puts data as first parameter
##D ntbt_inclass(smoking, response ~ TVPS + BPNL + COHB ~ TarY + NicY + COY + Sex + Age,
##D              pFUN = list(list(model = lm, predict = mypredict.lm)), cFUN = classify)
##D 
##D ## so it can be used easily in a pipeline.
##D smoking %>%
##D   ntbt_inclass(response ~ TVPS + BPNL + COHB ~ TarY + NicY + COY + Sex + Age,
##D                pFUN = list(list(model = lm, predict = mypredict.lm)), cFUN = classify)
##D 
##D 
##D ## ntbt_slda: Stabilised Linear Discriminant Analysis
##D library("mlbench")
##D library("MASS")
##D learn <- as.data.frame(mlbench.twonorm(100))
##D 
##D ## Original function to interface
##D slda(classes ~ ., data=learn)
##D 
##D ## The interface puts data as first parameter
##D ntbt_slda(learn, classes ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D learn %>%
##D   ntbt_slda(classes ~ .)
## End(Not run)



