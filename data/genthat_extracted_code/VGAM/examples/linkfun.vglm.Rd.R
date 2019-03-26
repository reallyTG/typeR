library(VGAM)


### Name: linkfun.vglm
### Title: Link Functions for VGLMs
### Aliases: linkfun.vglm
### Keywords: models regression

### ** Examples

fit1 <- vgam(cbind(r1, r2) ~ s(year, df = 3), gev(zero = 2:3), data = venice)
coef(fit1, matrix = TRUE)
linkfun(fit1)
linkfun(fit1, earg = TRUE)



