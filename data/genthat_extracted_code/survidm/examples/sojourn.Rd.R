library(survidm)


### Name: sojourn
### Title: Nonparametric estimation of the Sojourn time distributions in
###   the illness-death model
### Aliases: sojourn

### ** Examples


res <- sojourn(survIDM(time1, event1, Stime, event) ~ 1,
data = colonIDM, conf = FALSE, conf.level = 0.95)
res
summary(res, time=365*1:6)
plot(res)

res1 <- sojourn(survIDM(time1, event1, Stime, event) ~ 1,
data = colonIDM, conf = FALSE, conf.level = 0.95, method = "LM",
presmooth = TRUE)
res1
summary(res1, time=365*1:6)
plot(res1)


# not run:
#res2 <- sojourn(survIDM(time1, event1, Stime, event) ~ 1,
#data = colonIDM, conf = FALSE, conf.level = 0.95, method = "Satten-Datta")
#res2


# with a factor
res3 <- sojourn(survIDM(time1, event1, Stime, event) ~ factor(sex),
data = colonIDM, conf = FALSE, conf.level = 0.95)
res3
summary(res3, time=365*1:6)
plot(res3)

# with a qualitative covariate
res4 <- sojourn(survIDM(time1, event1, Stime, event) ~ age, data = colonIDM,
z.value = 56, conf = FALSE, conf.level = 0.95)
res4
summary(res4, time=365*1:6)
plot(res4)




