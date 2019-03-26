library(pls)


### Name: cppls.fit
### Title: CPPLS (Indahl et al.)
### Aliases: cppls.fit
### Keywords: regression classification multivariate

### ** Examples

data(mayonnaise)
# Create dummy response
mayonnaise$dummy <-
    I(model.matrix(~y-1, data.frame(y = factor(mayonnaise$oil.type))))

# Predict CPLS scores for test data
may.cpls <- cppls(dummy ~ NIR, 10, data = mayonnaise, subset = train)
may.test <- predict(may.cpls, newdata = mayonnaise[!mayonnaise$train,], type = "score")

# Predict CPLS scores for test data (experimental used design as additional Y information)
may.cpls.yadd <- cppls(dummy ~ NIR, 10, data = mayonnaise, subset = train, Y.add=design)
may.test.yadd <- predict(may.cpls.yadd, newdata = mayonnaise[!mayonnaise$train,], type = "score")

# Classification by linear discriminant analysis (LDA)
library(MASS)
error <- matrix(ncol = 10, nrow = 2)
dimnames(error) <- list(Model = c('CPLS', 'CPLS (Y.add)'), ncomp = 1:10)
for (i in 1:10) {
    fitdata1 <- data.frame(oil.type = mayonnaise$oil.type[mayonnaise$train],
                           NIR.score = I(may.cpls$scores[,1:i,drop=FALSE]))
    testdata1 <- data.frame(oil.type = mayonnaise$oil.type[!mayonnaise$train],
                            NIR.score = I(may.test[,1:i,drop=FALSE]))
    error[1,i] <-
        (42 - sum(predict(lda(oil.type ~ NIR.score, data = fitdata1),
                  newdata = testdata1)$class == testdata1$oil.type)) / 42
    fitdata2 <- data.frame(oil.type = mayonnaise$oil.type[mayonnaise$train],
                           NIR.score = I(may.cpls.yadd$scores[,1:i,drop=FALSE]))
    testdata2 <- data.frame(oil.type = mayonnaise$oil.type[!mayonnaise$train],
                            NIR.score = I(may.test.yadd[,1:i,drop=FALSE]))
    error[2,i] <-
        (42 - sum(predict(lda(oil.type ~ NIR.score, data = fitdata2),
                  newdata = testdata2)$class == testdata2$oil.type)) / 42
}
round(error,2)



