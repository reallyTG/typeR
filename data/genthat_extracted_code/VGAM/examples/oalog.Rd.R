library(VGAM)


### Name: oalog
### Title: One-Altered Logarithmic Distribution
### Aliases: oalog
### Keywords: models regression

### ** Examples

odata <- data.frame(x2 = runif(nn <- 1000))
odata <- transform(odata, pobs1 = logit(-1 + 2*x2, inverse = TRUE),
                          shape  = logit(-2 + 3*x2, inverse = TRUE))
odata <- transform(odata, y1 = roalog(nn, shape = shape, pobs1 = pobs1),
                          y2 = roalog(nn, shape = shape, pobs1 = pobs1))
with(odata, table(y1))

ofit <- vglm(cbind(y1, y2) ~ x2, oalog, data = odata, trace = TRUE)
coef(ofit, matrix = TRUE)
head(fitted(ofit))
head(predict(ofit))
summary(ofit)



