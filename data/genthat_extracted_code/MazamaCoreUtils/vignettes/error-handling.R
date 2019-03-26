## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----stopOnError---------------------------------------------------------
library(MazamaCoreUtils)
logger.setup()
logger.setLevel(TRACE)

# Arbitrarily deep in the stack we might have:
myFunc <- function(x) {
  a <- log(x)
}

result <- try({
  
  userInput <- 10
  result <- try({
    logger.trace("class(userInput) = %s", class(userInput))
    myFunc(x=userInput)
  }, silent=TRUE)
  stopOnError(result)
  
}, silent = FALSE)

# Continue despite any errors
  
result <- try({
  userInput <- "10"
  result <- try({
    logger.trace("class(userInput) = %s", class(userInput))
    myFunc(x=userInput)
  }, silent=TRUE)
  stopOnError(result)
}, silent = FALSE)

# Continue despite any errors

result <- try({
  result <- try({
    logger.trace("class(userInput) = %s", class(userInput))
    myFunc(x=userInput)
  }, silent=TRUE)
  stopOnError(result, "Unable to process user input")
}, silent = FALSE)

# Script completes with errors handled as they occurred

