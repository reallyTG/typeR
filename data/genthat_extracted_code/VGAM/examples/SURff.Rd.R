library(VGAM)


### Name: SURff
### Title: Seemingly Unrelated Regressions Family Function
### Aliases: SURff
### Keywords: models regression

### ** Examples

# Obtain some of the results of p.1199 of Kmenta and Gilbert (1968)
clist <- list("(Intercept)" = diag(2),
              "capital.g"   = rbind(1, 0),
              "value.g"     = rbind(1, 0),
              "capital.w"   = rbind(0, 1),
              "value.w"     = rbind(0, 1))
zef1 <- vglm(cbind(invest.g, invest.w) ~
             capital.g + value.g + capital.w + value.w,
             SURff(divisor = "sqrt"), maxit = 1,
             data = gew, trace = TRUE, constraints = clist)

round(coef(zef1, matrix = TRUE), digits = 4)  # ZEF
zef1@extra$ncols.X.lm
zef1@misc$divisor
zef1@misc$values.divisor
round(sqrt(diag(vcov(zef1))),    digits = 4)  # SEs
nobs(zef1, type = "lm")
df.residual(zef1, type = "lm")


mle1 <- vglm(cbind(invest.g, invest.w) ~
             capital.g + value.g + capital.w + value.w,
             SURff(mle.normal = TRUE),
             epsilon = 1e-11,
             data = gew, trace = TRUE, constraints = clist)
round(coef(mle1, matrix = TRUE), digits = 4)  # MLE
round(sqrt(diag(vcov(mle1))),    digits = 4)  # SEs



