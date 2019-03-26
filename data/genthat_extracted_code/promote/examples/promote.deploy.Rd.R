library(promote)


### Name: promote.deploy
### Title: Deploy a model to promote's servers
### Aliases: promote.deploy
### Keywords: deploy

### ** Examples

promote.config <- c(
 username = "your username",
 apikey = "your apikey",
 env = "http://sandbox.promotehq.com/"
)
iris$Sepal.Width_sq <- iris$Sepal.Width^2
fit <- glm(I(Species)=="virginica" ~ ., data=iris)

model.predict <- function(df) {
 data.frame("prediction"=predict(fit, df, type="response"))
}
## Not run: 
##D promote.library("randomForest")
##D promote.deploy("irisModel")
## End(Not run)



