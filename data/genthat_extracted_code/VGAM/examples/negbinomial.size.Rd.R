library(VGAM)


### Name: negbinomial.size
### Title: Negative Binomial Distribution Family Function With Known Size
### Aliases: negbinomial.size
### Keywords: models regression

### ** Examples

# Simulated data with various multiple responses
size1 <- exp(1); size2 <- exp(2); size3 <- exp(0); size4 <- Inf
ndata <- data.frame(x2 = runif(nn <- 1000))
ndata <- transform(ndata, eta1  = -1 - 2 * x2,  # eta1 must be negative
                          size1 = size1)
ndata <- transform(ndata,
                   mu1  = nbcanlink(eta1, size = size1, inv = TRUE))
ndata <- transform(ndata,
              y1 = rnbinom(nn, mu = mu1,         size = size1),  # NB-C
              y2 = rnbinom(nn, mu = exp(2 - x2), size = size2),
              y3 = rnbinom(nn, mu = exp(3 + x2), size = size3),  # NB-G
              y4 =   rpois(nn, lambda = exp(1 + x2)))

# Also known as NB-C with size known (Hilbe, 2011)
fit1 <- vglm(y1 ~ x2, negbinomial.size(size = size1, lmu = "nbcanlink"),
             data = ndata, trace = TRUE)
coef(fit1, matrix = TRUE)
head(fit1@misc$size)  # size saved here

fit2 <- vglm(cbind(y2, y3, y4) ~ x2, data = ndata, trace = TRUE,
             negbinomial.size(size = c(size2, size3, size4)))
coef(fit2, matrix = TRUE)
head(fit2@misc$size)  # size saved here



