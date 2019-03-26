library(ltm)


### Name: coef
### Title: Extract Estimated Loadings
### Aliases: coef.gpcm coef.grm coef.ltm coef.rasch coef.tpm
### Keywords: methods

### ** Examples


fit <- grm(Science[c(1,3,4,7)])
coef(fit)

fit <- ltm(LSAT ~ z1)
coef(fit, TRUE, TRUE)

m <- rasch(LSAT)
coef(fit, TRUE, TRUE)




