library(VGAM)


### Name: bistudentt
### Title: Bivariate Student-t Family Function
### Aliases: bistudentt
### Keywords: models regression

### ** Examples

nn <- 1000
mydof <- loglog(1, inverse = TRUE)
ymat <- cbind(rt(nn, df = mydof), rt(nn, df = mydof))
bdata <- data.frame(y1 = ymat[, 1], y2 = ymat[, 2],
                    y3 = ymat[, 1], y4 = ymat[, 2], x2 = runif(nn))
summary(bdata)
## Not run:  plot(ymat, col = "blue") 
fit1 <- vglm(cbind(y1, y2, y3, y4) ~ 1,  # 2 responses, e.g., (y1,y2) is the 1st
             fam = bistudentt,  # crit = "coef",  # Sometimes a good idea
             data = bdata, trace = TRUE)

coef(fit1, matrix = TRUE)
Coef(fit1)
head(fitted(fit1))
summary(fit1)



