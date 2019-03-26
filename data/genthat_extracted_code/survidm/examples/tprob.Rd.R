library(survidm)


### Name: tprob
### Title: Nonparametric estimation of transition probabilities in the
###   illness-death model
### Aliases: tprob

### ** Examples

# Aalen-Johansen
# Occupation Probabilities Pj(t)=Pij(0,t)

res <- tprob(survIDM(time1, event1, Stime, event) ~ 1, s = 0,
method = "AJ", conf = FALSE, data = colonIDM)

summary(res, time=365*1:6)
plot(res)


# Transition Probabilities Pij(t)=Pij(365,t)

# LIDA
res1 <- tprob(survIDM(time1, event1, Stime, event) ~ 1, s = 365,
method = "LIDA", conf = FALSE, data = colonIDM)

summary(res1, time=365*1:6)
plot(res1)
plot(res1, trans="01", ylim=c(0,0.15))

# Landmark (LM)
res2 <- tprob(survIDM(time1, event1, Stime, event) ~ 1, s = 365,
method = "LM", conf = FALSE, data = colonIDM)

summary(res2, time=365*1:6)
plot(res2)

# Presmoothed LM
res3 <- tprob(survIDM(time1, event1, Stime, event) ~ 1, s = 365,
method = "PLM", conf = FALSE, data = colonIDM)

summary(res3, time=365*1:6)
plot(res3)



# Conditional transition probabilities

#with factor
res4 <- tprob(survIDM(time1, event1, Stime, event) ~ factor(sex), s = 365,
method = "AJ", conf = FALSE, data = colonIDM)

summary(res4, time=365*1:6)
plot(res4, trans="02", ylim=c(0,0.5))

# with continuous covariate (IPCW)
res5 <- tprob(survIDM(time1, event1, Stime, event) ~ age, s = 365,
method = "IPCW", z.value = 48, conf = FALSE, data = colonIDM,
bw = "dpik", window = "gaussian", method.weights = "NW")

summary(res5, time=365*1:6)
plot(res5)


# Confidence intervals
#res6 <- tprob(survIDM(time1, event1, Stime, event) ~ 1, s = 365,
#method = "AJ", conf = TRUE, n.boot = 5, conf.level = 0.95,
#conf.type = "log", data = colonIDM)

#summary(res6, time=365*1:7)
#plot(res6)



