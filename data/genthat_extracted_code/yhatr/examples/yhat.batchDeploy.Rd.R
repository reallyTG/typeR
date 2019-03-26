library(yhatr)


### Name: yhat.batchDeploy
### Title: Deploy a batch model to Yhat servers
### Aliases: yhat.batchDeploy
### Keywords: deploy

### ** Examples

yhat.config <- c(
 username = "your username",
 apikey = "your apikey",
 env = "http://sandbox.yhathq.com/"
)
yhat.batch <- function() {
  name <- "ross"
  greeting <- paste("Hello", name)
  print(greeting)
}
## Not run: 
##D yhat.batchDeploy("helloworld")
## End(Not run)



