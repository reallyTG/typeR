library(VGAM)


### Name: vglm
### Title: Fitting Vector Generalized Linear Models
### Aliases: vglm
### Keywords: models regression

### ** Examples

# Example 1. See help(glm)
print(d.AD <- data.frame(treatment = gl(3, 3),
                         outcome = gl(3, 1, 9),
                         counts = c(18,17,15,20,10,20,25,13,12)))
vglm.D93 <- vglm(counts ~ outcome + treatment, family = poissonff,
                 data = d.AD, trace = TRUE)
summary(vglm.D93)


# Example 2. Multinomial logit model
pneumo <- transform(pneumo, let = log(exposure.time))
vglm(cbind(normal, mild, severe) ~ let, multinomial, data = pneumo)


# Example 3. Proportional odds model
fit3 <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo)
coef(fit3, matrix = TRUE)
constraints(fit3)
model.matrix(fit3, type = "lm")  # LM model matrix
model.matrix(fit3)               # Larger VGLM (or VLM) model matrix


# Example 4. Bivariate logistic model
fit4 <- vglm(cbind(nBnW, nBW, BnW, BW) ~ age, binom2.or, coalminers)
coef(fit4, matrix = TRUE)
depvar(fit4)  # Response are proportions
weights(fit4, type = "prior")


# Example 5. The use of the xij argument (simple case).
# The constraint matrix for 'op' has one column.
nn <- 1000
eyesdat <- round(data.frame(lop = runif(nn),
                            rop = runif(nn),
                             op = runif(nn)), digits = 2)
eyesdat <- transform(eyesdat, eta1 = -1 + 2 * lop,
                              eta2 = -1 + 2 * lop)
eyesdat <- transform(eyesdat,
           leye = rbinom(nn, size = 1, prob = logit(eta1, inverse = TRUE)),
           reye = rbinom(nn, size = 1, prob = logit(eta2, inverse = TRUE)))
head(eyesdat)
fit5 <- vglm(cbind(leye, reye) ~ op,
             binom2.or(exchangeable = TRUE, zero = 3),
             data = eyesdat, trace = TRUE,
             xij = list(op ~ lop + rop + fill(lop)),
             form2 = ~  op + lop + rop + fill(lop))
coef(fit5)
coef(fit5, matrix = TRUE)
constraints(fit5)
fit5@control$xij
head(model.matrix(fit5))



