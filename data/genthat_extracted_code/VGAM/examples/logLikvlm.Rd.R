library(VGAM)


### Name: logLik.vlm
### Title: Extract Log-likelihood for VGLMs/VGAMs/etc.
### Aliases: logLik.vlm
### Keywords: models regression

### ** Examples

zdata <- data.frame(x2 = runif(nn <- 50))
zdata <- transform(zdata, Ps01    = logit(-0.5       , inverse = TRUE),
                          Ps02    = logit( 0.5       , inverse = TRUE),
                          lambda1 =  loge(-0.5 + 2*x2, inverse = TRUE),
                          lambda2 =  loge( 0.5 + 2*x2, inverse = TRUE))
zdata <- transform(zdata, y1 = rzipois(nn, lambda = lambda1, pstr0 = Ps01),
                          y2 = rzipois(nn, lambda = lambda2, pstr0 = Ps02))

with(zdata, table(y1))  # Eyeball the data
with(zdata, table(y2))
fit2 <- vglm(cbind(y1, y2) ~ x2, zipoisson(zero = NULL), data = zdata)

logLik(fit2)  # Summed over the two responses
sum(logLik(fit2, sum = FALSE))  # For checking purposes
(ll.matrix <- logLik(fit2, sum = FALSE))  # nn x 2 matrix
colSums(ll.matrix)  # log-likelihood for each response



