library(VGAM)


### Name: binormalcop
### Title: Gaussian Copula (Bivariate) Family Function
### Aliases: binormalcop
### Keywords: models regression

### ** Examples

nn <- 1000
ymat <- rbinormcop(n = nn, rho = rhobit(-0.9, inverse = TRUE))
bdata <- data.frame(y1 = ymat[, 1],
                    y2 = ymat[, 2],
                    y3 = ymat[, 1],
                    y4 = ymat[, 2],
                    x2 = runif(nn))

summary(bdata)
## Not run:  plot(ymat, col = "blue") 
fit1 <- vglm(cbind(y1, y2, y3, y4) ~ 1,  # 2 responses, e.g., (y1,y2) is the first
             fam = binormalcop,
             crit = "coef",  # Sometimes a good idea
             data = bdata, trace = TRUE)

coef(fit1, matrix = TRUE)
Coef(fit1)
head(fitted(fit1))
summary(fit1)

# Another example; rho is a linear function of x2
bdata <- transform(bdata, rho = -0.5 + x2)
ymat <- rbinormcop(n = nn, rho = with(bdata, rho))
bdata <- transform(bdata, y5 = ymat[, 1],
                          y6 = ymat[, 2])
fit2 <- vgam(cbind(y5, y6) ~ s(x2), data = bdata,
             binormalcop(lrho = "identitylink"), trace = TRUE)
## Not run:  plot(fit2, lcol = "blue", scol = "orange", se = TRUE, las = 1) 



