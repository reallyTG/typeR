library(qad)


### Name: predict.qad
### Title: Predict conditional probabilities
### Aliases: predict.qad

### ** Examples

n <- 1000
x <- runif(n, -1 ,1)
y <- x^2 + rnorm(n, 0, 1)
sample <- data.frame(x, y)

##(Not Run)
#mod <- qad(sample)
#val <- c(-0.5, 0,1)
#predict(mod, values = val, conditioned = "x1", copula = FALSE, pred_plot = TRUE)
#predict(mod, values = val, conditioned = "x1", copula = TRUE)
#predict(mod, values = val, conditioned = "x1", copula = TRUE, pred_plot = TRUE)





