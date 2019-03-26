library(survidm)


### Name: CIF
### Title: Nonparametric estimation of the Cumulative Incident Functions in
###   the illness-death model
### Aliases: CIF

### ** Examples


# Cumulative Incidence Function (CIF)
res <- CIF(survIDM(time1, event1, Stime, event) ~ 1, data = colonIDM,
conf = FALSE)
res
summary(res, time=365*1:7)
plot(res, ylim=c(0, 0.6))

res01 <- CIF(survIDM(time1, event1, Stime, event) ~ 1, data = colonIDM,
conf = FALSE, presmooth = TRUE)
res01
summary(res01, time=365*1:7)
plot(res01, ylim=c(0, 0.6))


# CIF for those in State 1 at time s=365, Y(s)=0
res1 <- CIF(survIDM(time1, event1, Stime, event) ~ 1, data = colonIDM,
s = 365, conf = FALSE)
summary(res1, time=365*1:7)
plot(res1, ylim=c(0, 0.6))


# Conditional CIF (with a factor)
res2 <- CIF(survIDM(time1, event1, Stime, event) ~ factor(sex),
data = colonIDM, s = 365, conf = FALSE)
summary(res2, time=365*1:5)
plot(res2)

res2.1 <- CIF(survIDM(time1, event1, Stime, event) ~ factor(sex),  #new
data = colonIDM, s = 365, conf = FALSE, presmooth = TRUE)
summary(res2.1, time=365*1:5)
plot(res2.1)


# Conditional CIF (with continuous covariate)
res3 <- CIF(survIDM(time1, event1, Stime, event) ~ age, data = colonIDM,
z.value = 56, conf = FALSE)
summary(res3, time=365*1:6)
plot(res3)




