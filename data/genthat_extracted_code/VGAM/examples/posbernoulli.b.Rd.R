library(VGAM)


### Name: posbernoulli.b
### Title: Positive Bernoulli Family Function with Behavioural Effects
### Aliases: posbernoulli.b
### Keywords: models regression

### ** Examples

# deermice data ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

# Fit a M_b model
M.b <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ 1,
            posbernoulli.b, data = deermice, trace = TRUE)
coef(M.b)["(Intercept):1"]  # Behavioural effect on the logit scale
coef(M.b, matrix = TRUE)
constraints(M.b, matrix = TRUE)
summary(M.b, presid = FALSE)

# Fit a M_bh model
M.bh <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + weight,
             posbernoulli.b, data = deermice, trace = TRUE)
coef(M.bh, matrix = TRUE)
coef(M.bh)["(Intercept):1"]  # Behavioural effect on the logit scale
constraints(M.bh)  # (2,1) element of "(Intercept)" is for the behavioural effect
summary(M.bh, presid = FALSE)  # Significant positive (trap-happy) behavioural effect
# Approx. 95 percent confidence for the behavioural effect:
SE.M.bh <- coef(summary(M.bh))["(Intercept):1", "Std. Error"]
coef(M.bh)["(Intercept):1"] + c(-1, 1) * 1.96 * SE.M.bh

# Fit a M_h model
M.h <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + weight,
            posbernoulli.b(drop.b = TRUE ~ sex + weight),
            data = deermice, trace = TRUE)
coef(M.h, matrix = TRUE)
constraints(M.h, matrix = TRUE)
summary(M.h, presid = FALSE)

# Fit a M_0 model
M.0 <- vglm(cbind(    y1 + y2 + y3 + y4 + y5 + y6,
                  6 - y1 - y2 - y3 - y4 - y5 - y6) ~ 1,
            posbinomial, data = deermice, trace = TRUE)
coef(M.0, matrix = TRUE)
summary(M.0, presid = FALSE)


# Simulated data set ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
set.seed(123); nTimePts <- 5; N <- 1000  # N is the popn size
pdata <- rposbern(n = N, nTimePts = nTimePts, pvars = 2, is.popn = TRUE)
nrow(pdata)  # Less than N (because some animals were never captured)
# The truth: xcoeffs are c(-2, 1, 2) and cap.effect = +1

M.bh.2 <- vglm(cbind(y1, y2, y3, y4, y5) ~ x2,
               posbernoulli.b, data = pdata, trace = TRUE)
coef(M.bh.2)
coef(M.bh.2, matrix = TRUE)
constraints(M.bh.2, matrix = TRUE)
summary(M.bh.2, presid = FALSE)
head(depvar(M.bh.2))    # Capture history response matrix
head(M.bh.2@extra$cap.hist1)  # Info on its capture history
head(M.bh.2@extra$cap1)  # When it was first captured
head(fitted(M.bh.2))     # Depends on capture history
(trap.effect <- coef(M.bh.2)["(Intercept):1"])  # Should be +1
head(model.matrix(M.bh.2, type = "vlm"), 21)
head(pdata)
summary(pdata)
dim(depvar(M.bh.2))
vcov(M.bh.2)

M.bh.2@extra$N.hat     # Estimate of the population size; should be about N
M.bh.2@extra$SE.N.hat  # SE of the estimate of the population size
# An approximate 95 percent confidence interval:
round(M.bh.2@extra$N.hat + c(-1, 1) * 1.96 *  M.bh.2@extra$SE.N.hat, 1)



