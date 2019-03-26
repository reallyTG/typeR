library(mcemGLM)


### Name: exdata
### Title: Example data
### Aliases: exdata
### Keywords: datasets

### ** Examples

set.seed(123)
obs <- c(sample(0:1, 30, TRUE, prob = c(0.5, 0.5)), sample(0:1, 30, TRUE, prob = c(0.3, 0.7)))
obs2 <- c(rpois(30, 5), rpois(30, 10))



