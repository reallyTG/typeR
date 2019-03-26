library(SEL)


### Name: rvSEL
### Title: Simulate from the expert's distribution
### Aliases: rvSEL
### Keywords: misc

### ** Examples

## bimodal example 
x2 <- c(0.1, 0.2, 0.5, 0.8, 0.9)
y2 <- c(0.2, 0.4, 0.45, 0.85, 0.99)

fit1 <- SEL(x2, y2, Delta=0.05, d = 4, inknts = x2)
fit2 <- SEL(x2, y2, Delta=0.05, d = 15, N = 0)
comparePlot(fit1, fit2, superpose = TRUE)

## sample from SEL object
xxx <- rvSEL(50000, fit1)
hist(xxx, breaks=100, freq=FALSE)
curve(predict(fit1, newdata=x), add=TRUE)



