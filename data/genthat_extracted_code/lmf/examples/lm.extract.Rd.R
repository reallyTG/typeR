library(lmf)


### Name: lm.extract
### Title: Extract linear regression components
### Aliases: lm.extract

### ** Examples

#Simulated data
xx <- rnorm(n = 100, mean = 10, sd = 2)
yy <- xx + 10 + rnorm(n = 100, 0, 2)
#Extract linear model components
extract <- lm.extract(formula = yy ~ xx, data = data.frame(xx = xx, yy = yy))
str(extract)
#Plot the xx-yy relation
plot(xx, yy)
abline(a = extract$ajt[1], b = extract$ajt[2])



