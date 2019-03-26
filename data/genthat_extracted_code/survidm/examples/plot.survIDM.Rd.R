library(survidm)


### Name: plot.survIDM
### Title: Plot for an object of class "survIDM".
### Aliases: plot.survIDM

### ** Examples

res <- tprob(survIDM(time1, event1, Stime, event) ~ 1, s = 0,
method = "AJ", conf = FALSE, data = colonIDM)

plot(res)
plot(res, trans = "02")


res1 <- tprob(survIDM(time1, event1, Stime, event) ~ factor(sex), s = 365,
method = "AJ", conf = FALSE, data = colonIDM)

plot(res1, trans="02", ylim=c(0,0.5))


res2 <- CIF(survIDM(time1, event1, Stime, event) ~ age, data = colonIDM,
z.value = 56, conf = FALSE)

plot(res2)


res3 <- sojourn(survIDM(time1, event1, Stime, event) ~ factor(sex),
data = colonIDM, conf = FALSE, conf.level = 0.95)

plot(res3)




