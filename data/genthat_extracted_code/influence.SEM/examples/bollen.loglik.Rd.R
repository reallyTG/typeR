library(influence.SEM)


### Name: bollen.loglik
### Title: Log-Likelihood of a sem model (Internal function).
### Aliases: bollen.loglik
### Keywords: utility

### ** Examples

data("PDII")
model <- "
  F1 =~ y1+y2+y3+y4
"
fit0 <- sem(model, data=PDII)
N <- fit0@Data@nobs[[1]]
S <- fit0@SampleStats@cov[[1]]
Sigma <- fitted(fit0)$cov
bollen.loglik(N,S,Sigma)



