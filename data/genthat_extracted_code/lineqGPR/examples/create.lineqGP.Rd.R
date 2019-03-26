library(lineqGPR)


### Name: create.lineqGP
### Title: Creation Method for the '"lineqGP"' S3 Class
### Aliases: create.lineqGP

### ** Examples

# creating the model
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, length = 5)
y <- sigfun(x)
model <- create(class = "lineqGP", x, y, constrType = "monotonicity")
model




