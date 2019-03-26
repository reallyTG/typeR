library(naivebayes)


### Name: predict.naive_bayes
### Title: Predict Method for naive_bayes Objects
### Aliases: predict.naive_bayes

### ** Examples

ind_iris <- sample(1:nrow(iris), size = round(0.3 * nrow(iris)))
iris_train <- iris[-ind_iris, ]
iris_test <- iris[ind_iris, ]

nb_iris <- naive_bayes(Species ~ ., iris_train)
predict(nb_iris, iris_test)
head(predict(nb_iris, iris_test, type = "prob"))


## Not run: 
##D vars <- 10
##D rows <- 500000
##D y <- sample(c("a", "b"), rows, TRUE)
##D 
##D # Only categorical variables
##D X1 <- as.data.frame(matrix(sample(letters[5:9], vars * rows, TRUE),
##D                            ncol = vars))
##D nb_cat <- naive_bayes(x = X1, y = y)
##D nb_cat
##D system.time(pred2 <- predict(nb_cat, X1))
##D 
##D # Only numeric variables
##D X2 <- as.data.frame(matrix(rnorm(vars * rows), ncol = vars))
##D nb_num <- naive_bayes(x = X2, y = y)
##D nb_num
##D system.time(pred2 <- predict(nb_num, X2))
## End(Not run)



