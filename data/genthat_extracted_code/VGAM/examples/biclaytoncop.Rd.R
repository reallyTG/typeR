library(VGAM)


### Name: biclaytoncop
### Title: Clayton Copula (Bivariate) Family Function
### Aliases: biclaytoncop
### Keywords: models regression

### ** Examples

ymat <- rbiclaytoncop(n = (nn <- 1000), apar = exp(2))
bdata <- data.frame(y1 = ymat[, 1],
                    y2 = ymat[, 2],
                    y3 = ymat[, 1],
                    y4 = ymat[, 2],
                    x2 = runif(nn))

summary(bdata)
## Not run:  plot(ymat, col = "blue") 
fit1 <- vglm(cbind(y1, y2, y3, y4) ~ 1,  # 2 responses, e.g., (y1,y2) is the first
             biclaytoncop, data = bdata,
             trace = TRUE, crit = "coef")  # Sometimes a good idea

coef(fit1, matrix = TRUE)
Coef(fit1)
head(fitted(fit1))
summary(fit1)

# Another example; apar is a function of x2
bdata <- transform(bdata, apar = exp(-0.5 + x2))
ymat <- rbiclaytoncop(n = nn, apar = with(bdata, apar))
bdata <- transform(bdata, y5 = ymat[, 1],
                          y6 = ymat[, 2])
fit2 <- vgam(cbind(y5, y6) ~ s(x2), data = bdata,
             biclaytoncop(lapar = "loge"), trace = TRUE)
## Not run:  plot(fit2, lcol = "blue", scol = "orange", se = TRUE, las = 1) 



