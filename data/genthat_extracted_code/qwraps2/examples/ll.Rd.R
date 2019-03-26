library(qwraps2)


### Name: ll
### Title: List Object Aliases
### Aliases: ll

### ** Examples

# View your current workspace
## Not run: 
##D ls()
##D ll()
## End(Not run)

# View another environment
e <- new.env()
e$fit <- lm(mpg ~ wt, mtcars)
e$fit2 <- lm(mpg ~ wt + am + vs, data = mtcars)
e$x <- rnorm(1e5)
e$y <- runif(1e4)
e$z <- with(e, x * y)
e$w <- sum(e$z)
ls(e)
ll(e)
ll(e, head = TRUE)




