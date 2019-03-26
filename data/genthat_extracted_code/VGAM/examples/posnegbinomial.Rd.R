library(VGAM)


### Name: posnegbinomial
### Title: Positive Negative Binomial Distribution Family Function
### Aliases: posnegbinomial
### Keywords: models regression

### ** Examples

pdata <- data.frame(x2 = runif(nn <- 1000))
pdata <- transform(pdata, y1 = rposnegbin(nn, munb = exp(0+2*x2), size = exp(1)),
                          y2 = rposnegbin(nn, munb = exp(1+2*x2), size = exp(3)))
fit <- vglm(cbind(y1, y2) ~ x2, posnegbinomial, data = pdata, trace = TRUE)
coef(fit, matrix = TRUE)
dim(depvar(fit))  # Using dim(fit@y) is not recommended


# Another artificial data example
pdata2 <- data.frame(munb = exp(2), size = exp(3)); nn <- 1000
pdata2 <- transform(pdata2, y3 = rposnegbin(nn, munb = munb, size = size))
with(pdata2, table(y3))
fit <- vglm(y3 ~ 1, posnegbinomial, data = pdata2, trace = TRUE)
coef(fit, matrix = TRUE)
with(pdata2, mean(y3))  # Sample mean
head(with(pdata2, munb/(1-(size/(size+munb))^size)), 1)  # Population mean
head(fitted(fit), 3)
head(predict(fit), 3)


# Example: Corbet (1943) butterfly Malaya data
fit <- vglm(ofreq ~ 1, posnegbinomial, weights = species, data = corbet)
coef(fit, matrix = TRUE)
Coef(fit)
(khat <- Coef(fit)["size"])
pdf2 <- dposnegbin(x = with(corbet, ofreq), mu = fitted(fit), size = khat)
print(with(corbet, cbind(ofreq, species, fitted = pdf2*sum(species))), dig = 1)
## Not run: 
##D with(corbet,
##D matplot(ofreq, cbind(species, fitted = pdf2*sum(species)), las = 1,
##D         xlab = "Observed frequency (of individual butterflies)",
##D         type = "b", ylab = "Number of species", col = c("blue", "orange"),
##D         main = "blue 1s = observe; orange 2s = fitted"))
## End(Not run)

## Not run: 
##D # This data (courtesy of Maxim Gerashchenko) causes posbinomial() to fail
##D pnbd.fail <- data.frame(
##D  y1 = c(1:16, 18:21, 23:28, 33:38, 42, 44, 49:51, 55, 56, 58,
##D  59, 61:63, 66, 73, 76, 94, 107, 112, 124, 190, 191, 244),
##D  ofreq = c(130, 80, 38, 23, 22, 11, 21, 14, 6, 7, 9, 9, 9, 4, 4, 5, 1,
##D            4, 6, 1, 3, 2, 4, 3, 4, 5, 3, 1, 2, 1, 1, 4, 1, 2, 2, 1, 3,
##D            1, 1, 2, 2, 2, 1, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1))
##D fit.fail <- vglm(y1 ~ 1, weights = ofreq, posnegbinomial,
##D                trace = TRUE, data = pnbd.fail)
## End(Not run)



