library(ltm)


### Name: fitted
### Title: Fitted Values for IRT model
### Aliases: fitted.gpcm fitted.grm fitted.ltm fitted.rasch fitted.tpm
### Keywords: methods

### ** Examples

fit <- grm(Science[c(1,3,4,7)])
fitted(fit, resp.patterns = matrix(1:4, nr = 4, nc = 4))

fit <- rasch(LSAT)
fitted(fit, type = "conditional-probabilities")



