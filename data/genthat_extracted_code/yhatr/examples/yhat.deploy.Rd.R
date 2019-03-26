library(yhatr)


### Name: yhat.deploy
### Title: Deploy a model to Yhat's servers
### Aliases: yhat.deploy
### Keywords: deploy

### ** Examples

yhat.config <- c(
 username = "your username",
 apikey = "your apikey",
 env = "http://sandbox.yhathq.com/"
)
iris$Sepal.Width_sq <- iris$Sepal.Width^2
fit <- glm(I(Species)=="virginica" ~ ., data=iris)

model.require <- function() {
 # require("randomForest")
}

model.transform <- function(df) {
 df$Sepal.Width_sq <- df$Sepal.Width^2
 df
}
model.predict <- function(df) {
 data.frame("prediction"=predict(fit, df, type="response"))
}
## Not run: 
##D yhat.deploy("irisModel")
##D yhat.deploy("irisModelCustomImage", custom_image="myImage:latest")
## End(Not run)



