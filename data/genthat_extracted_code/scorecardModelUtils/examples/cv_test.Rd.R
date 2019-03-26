library(scorecardModelUtils)


### Name: cv_test
### Title: Cramer's V value between two categorical variables
### Aliases: cv_test

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Sepal.Length <- as.character(floor(data$Sepal.Length))
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
cv_result <- cv_test(base = data,var_1 = "Species",var_2 = "Sepal.Length")



