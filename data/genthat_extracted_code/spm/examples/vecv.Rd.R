library(spm)


### Name: vecv
### Title: Variance explained by predictive models based on
###   cross-validation
### Aliases: vecv

### ** Examples

set.seed(1234)
x <- sample(1:30, 30)
e <- rnorm(30, 1)
y <- x + e
vecv(x, y)

y <- 0.8 * x + e
vecv(x, y)




