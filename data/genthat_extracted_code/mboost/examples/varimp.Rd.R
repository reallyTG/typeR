library(mboost)


### Name: varimp
### Title: Variable Importance
### Aliases: varimp varimp.mboost plot.varimp as.data.frame.varimp

### ** Examples


data(iris)
### glmboost with multiple variables and intercept
iris$setosa <- factor(iris$Species == "setosa")
iris_glm <- glmboost(setosa ~ 1 + Sepal.Width + Sepal.Length + Petal.Width +
                         Petal.Length,
                     data = iris, control = boost_control(mstop = 50), 
                     family = Binomial(link = c("logit")))
varimp(iris_glm)
### importance plot with four bars only
plot(varimp(iris_glm), nbars = 4)

### gamboost with multiple variables
iris_gam <- gamboost(Sepal.Width ~ 
                         bols(Sepal.Length, by = setosa) +
                         bbs(Sepal.Length, by = setosa, center = TRUE) + 
                         bols(Petal.Width) +
                         bbs(Petal.Width, center = TRUE) + 
                         bols(Petal.Length) +
                         bbs(Petal.Length, center = TRUE),
                     data = iris)
varimp(iris_gam)
### stacked importance plot with base-learners in rev. alphabetical order
plot(varimp(iris_gam), blorder = "rev_alphabetical")

### similar ggplot
## Not run: 
##D  
##D library(ggplot2)
##D ggplot(data.frame(varimp(iris_gam)), aes(variable, reduction, fill = blearner)) + 
##D     geom_bar(stat = "identity") + coord_flip() 
## End(Not run)



