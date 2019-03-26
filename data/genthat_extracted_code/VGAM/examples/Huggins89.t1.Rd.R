library(VGAM)


### Name: Huggins89.t1
### Title: Table 1 of Huggins (1989)
### Aliases: Huggins89.t1 Huggins89table1
### Keywords: datasets

### ** Examples

Huggins89table1 <- transform(Huggins89table1, x3.tij = t01,
                             T02 = t02, T03 = t03, T04 = t04, T05 = t05, T06 = t06,
                             T07 = t07, T08 = t08, T09 = t09, T10 = t10)
small.table1 <- subset(Huggins89table1,
                       y01 + y02 + y03 + y04 + y05 + y06 + y07 + y08 + y09 + y10 > 0)
# fit.tbh is the bottom equation on p.133.
# It is a M_tbh model.
fit.tbh <-
  vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10) ~  x2 + x3.tij,
       xij = list(x3.tij ~ t01 + t02 + t03 + t04 + t05 + t06 + t07 + t08 + t09 + t10 +
                                 T02 + T03 + T04 + T05 + T06 + T07 + T08 + T09 + T10 - 1),
       posbernoulli.tb(parallel.t = TRUE ~ x2 + x3.tij),
       data = small.table1, trace = TRUE,
       form2 = ~  x2 + x3.tij +
                  t01 + t02 + t03 + t04 + t05 + t06 + t07 + t08 + t09 + t10 +
                        T02 + T03 + T04 + T05 + T06 + T07 + T08 + T09 + T10)

# These results differ a bit from Huggins (1989), probably because
# two animals had to be removed here (they were never caught):
coef(fit.tbh)  # First element is the behavioural effect
sqrt(diag(vcov(fit.tbh)))  # SEs
constraints(fit.tbh, matrix = TRUE)
summary(fit.tbh, presid = FALSE)
fit.tbh@extra$N.hat     # Estimate of the population site N; cf. 20.86
fit.tbh@extra$SE.N.hat  # Its standard error; cf. 1.87 or 4.51

fit.th <- vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10) ~ x2,
               posbernoulli.t, data = small.table1, trace = TRUE)
coef(fit.th)
constraints(fit.th)
coef(fit.th, matrix = TRUE)  # M_th model
summary(fit.th, presid = FALSE)
fit.th@extra$N.hat     # Estimate of the population size N
fit.th@extra$SE.N.hat  # Its standard error

fit.bh <- vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10) ~ x2,
               posbernoulli.b(I2 = FALSE), data = small.table1, trace = TRUE)
coef(fit.bh)
constraints(fit.bh)
coef(fit.bh, matrix = TRUE)  # M_bh model
summary(fit.bh, presid = FALSE)
fit.bh@extra$N.hat
fit.bh@extra$SE.N.hat

fit.h <- vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10) ~ x2,
             posbernoulli.b, data = small.table1, trace = TRUE)
coef(fit.h, matrix = TRUE)  # M_h model (version 1)
coef(fit.h)
summary(fit.h, presid = FALSE)
fit.h@extra$N.hat
fit.h@extra$SE.N.hat

Fit.h <- vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10) ~ x2,
              posbernoulli.t(parallel.t = TRUE ~ x2),
              data = small.table1, trace = TRUE)
coef(Fit.h)
coef(Fit.h, matrix = TRUE)  # M_h model (version 2)
summary(Fit.h, presid = FALSE)
Fit.h@extra$N.hat
Fit.h@extra$SE.N.hat



