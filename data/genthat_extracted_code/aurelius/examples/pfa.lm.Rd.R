library(aurelius)


### Name: pfa.lm
### Title: PFA Formatting of Fitted Linear models
### Aliases: pfa.lm

### ** Examples

X1 <- rnorm(100)
X2 <- runif(100)
Y <- 3 - 5 * X1 + 3 * X2 + rnorm(100, 0, 3)

model <- lm(Y ~ X1 + X2)
model_as_pfa <- pfa(model)



