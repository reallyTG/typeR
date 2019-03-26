
library("MASS")

mp <- polr(Sat ~ Infl, weights = Freq, data = housing)

library("mlt")

s <- as.basis(~ Infl, data = housing, remove_intercept = TRUE)
r <- as.basis(housing$Sat)
#r <- as.basis(~ Sat, data = housing, remove_intercept = TRUE,
#              contrasts.arg = list(Sat = function(n) 
#                  contr.treatment(n, base = 3)),
#              ui = diff(diag(2)), ci = 0)

m <- ctm(r, shift = s, todist = "Logi")

mod <- mlt(m, data = housing, weights = housing$Freq)

logLik(mp)
logLik(mod)

coef(mp)
mp$zeta
coef(mod)

sqrt(diag(vcov(mp)))
sqrt(diag(vcov(mod)))

mp <- polr(Sat ~ Infl, weights = Freq, data = housing, method = "loglog")

s <- as.basis(~ Infl, data = housing, remove_intercept = TRUE)
r <- as.basis(housing$Sat)
m <- ctm(r, shift = s, todist = "MaxExtrVal")

mod <- mlt(m, data = housing, weights = housing$Freq)

logLik(mp)
logLik(mod)

coef(mp)
mp$zeta
coef(mod)

sqrt(diag(vcov(mp)))
sqrt(diag(vcov(mod)))

mp <- polr(Sat ~ Infl, weights = Freq, data = housing, method = "cloglog")

s <- as.basis(~ Infl, data = housing, remove_intercept = TRUE)
r <- as.basis(housing$Sat)
m <- ctm(r, shift = s, todist = "MinExtrVal")

mod <- mlt(m, data = housing, weights = housing$Freq)

logLik(mp)
logLik(mod)

coef(mp)
mp$zeta
coef(mod)

sqrt(diag(vcov(mp)))
sqrt(diag(vcov(mod)))

mp <- polr(Sat ~ Infl, weights = Freq, data = housing, method = "probit")

s <- as.basis(~ Infl, data = housing, remove_intercept = TRUE)
r <- as.basis(housing$Sat)
m <- ctm(r, shift = s, todist = "Normal")

mod <- mlt(m, data = housing, weights = housing$Freq)

logLik(mp)
logLik(mod)

coef(mp)
mp$zeta
coef(mod)

sqrt(diag(vcov(mp)))
sqrt(diag(vcov(mod)))

