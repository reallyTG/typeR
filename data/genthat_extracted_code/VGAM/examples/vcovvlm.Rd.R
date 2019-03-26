library(VGAM)


### Name: vcovvlm
### Title: Calculate Variance-Covariance Matrix for a Fitted VLM or RR-VGLM
###   or QRR-VGLM Object
### Aliases: vcov vcovvlm vcovrrvglm vcovqrrvglm
### Keywords: models regression

### ** Examples

ndata <- data.frame(x2 = runif(nn <- 300))
ndata <- transform(ndata, y1 = rnbinom(nn, mu = exp(3+x2), size = exp(1)),
                          y2 = rnbinom(nn, mu = exp(2-x2), size = exp(0)))
fit1 <- vglm(cbind(y1, y2) ~ x2, negbinomial, data = ndata, trace = TRUE)
fit2 <- rrvglm(y1 ~ x2, negbinomial(zero = NULL), data = ndata)
coef(fit1, matrix = TRUE)
vcov(fit1)
vcov(fit2)



