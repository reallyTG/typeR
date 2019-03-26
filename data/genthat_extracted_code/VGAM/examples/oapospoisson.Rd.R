library(VGAM)


### Name: oapospoisson
### Title: One-Altered Positive-Poisson Distribution
### Aliases: oapospoisson
### Keywords: models regression

### ** Examples

odata <- data.frame(x2 = runif(nn <- 1000))
odata <- transform(odata, pobs1  = logit(-1 + 2*x2, inverse = TRUE),
                          lambda =  loge( 1 + 1*x2, inverse = TRUE))
odata <- transform(odata, y1 = roapospois(nn, lambda = lambda, pobs1 = pobs1),
                          y2 = roapospois(nn, lambda = lambda, pobs1 = pobs1))
with(odata, table(y1))

ofit <- vglm(cbind(y1, y2) ~ x2, oapospoisson, data = odata, trace = TRUE)
coef(ofit, matrix = TRUE)
head(fitted(ofit))
head(predict(ofit))
summary(ofit)



