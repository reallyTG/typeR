library(VGAM)


### Name: posbernoulli.t
### Title: Positive Bernoulli Family Function with Time Effects
### Aliases: posbernoulli.t
### Keywords: models regression

### ** Examples

M.t <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ 1, posbernoulli.t,
            data = deermice, trace = TRUE)
coef(M.t, matrix = TRUE)
constraints(M.t, matrix = TRUE)
summary(M.t, presid = FALSE)

M.h.1 <- vglm(Select(deermice, "y") ~ sex + weight, trace = TRUE,
              posbernoulli.t(parallel.t = FALSE ~ -1), data = deermice)
coef(M.h.1, matrix = TRUE)
constraints(M.h.1)
summary(M.h.1, presid = FALSE)
head(depvar(M.h.1))  # Response capture history matrix
dim(depvar(M.h.1))

M.th.2 <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + weight, trace = TRUE,
               posbernoulli.t(parallel.t = FALSE), data = deermice)
lrtest(M.h.1, M.th.2)  # Test the parallelism assumption wrt sex and weight
coef(M.th.2)
coef(M.th.2, matrix = TRUE)
constraints(M.th.2)
summary(M.th.2, presid = FALSE)
head(model.matrix(M.th.2, type = "vlm"), 21)

M.th.2@extra$N.hat     # Estimate of the population size; should be about N
M.th.2@extra$SE.N.hat  # SE of the estimate of the population size
# An approximate 95 percent confidence interval:
round(M.th.2@extra$N.hat + c(-1, 1) * 1.96 *  M.th.2@extra$SE.N.hat, 1)

# Fit a M_h model, effectively the parallel M_t model, using posbinomial()
deermice <- transform(deermice, ysum = y1 + y2 + y3 + y4 + y5 + y6,
                                tau  = 6)
M.h.3 <- vglm(cbind(ysum, tau - ysum) ~ sex + weight,
              posbinomial(omit.constant = TRUE), data = deermice, trace = TRUE)
max(abs(coef(M.h.1) - coef(M.h.3)))  # Should be zero
logLik(M.h.3) - logLik(M.h.1)  # Difference is due to the binomial constants



