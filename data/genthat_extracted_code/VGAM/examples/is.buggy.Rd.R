library(VGAM)


### Name: is.buggy
### Title: Does the Fitted Object Suffer from a Known Bug?
### Aliases: is.buggy is.buggy.vlm
### Keywords: models regression

### ** Examples

fit1 <- vgam(cbind(agaaus, kniexc) ~ s(altitude, df = c(3, 4)),
             binomialff(multiple.responses = TRUE), data = hunua)
is.buggy(fit1)  # Okay
is.buggy(fit1, each.term = TRUE)  # No terms are buggy

fit2 <- vgam(cbind(agaaus, kniexc) ~ s(altitude, df = c(3, 4)),
             binomialff(multiple.responses = TRUE), data = hunua,
             constraints =
             list("(Intercept)" = diag(2),
                  "s(altitude, df = c(3, 4))" = matrix(c(1, 1, 0, 1), 2, 2)))
is.buggy(fit2)  # TRUE
is.buggy(fit2, each.term = TRUE)
constraints(fit2)

# fit2b is an approximate alternative to fit2:
fit2b <- vglm(cbind(agaaus, kniexc) ~ bs(altitude, df = 3) + bs(altitude, df = 4),
              binomialff(multiple.responses = TRUE), data = hunua,
              constraints =
              list("(Intercept)" = diag(2),
                   "bs(altitude, df = 3)" = rbind(1, 1),
                   "bs(altitude, df = 4)" = rbind(0, 1)))
is.buggy(fit2b)  # Okay
is.buggy(fit2b, each.term = TRUE)
constraints(fit2b)



