library(lineqGPR)


### Name: create.lineqDGP
### Title: Creation Method for the '"lineqDGP"' S3 Class
### Aliases: create.lineqDGP

### ** Examples

# creating the model
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, length = 5)
y <- sigfun(x)
model <- create(class = "lineqDGP", x, y, constrType = "monotonicity")
model




