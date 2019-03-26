library(VGAM)


### Name: bigumbelIexp
### Title: Gumbel's Type I Bivariate Distribution Family Function
### Aliases: bigumbelIexp
### Keywords: models regression

### ** Examples

nn <- 1000
gdata <- data.frame(y1 = rexp(nn), y2 = rexp(nn))
## Not run:  with(gdata, plot(cbind(y1, y2))) 
fit <- vglm(cbind(y1, y2) ~ 1, bigumbelIexp, data = gdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
head(fitted(fit))



