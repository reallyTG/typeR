library(erer)


### Name: maTrend
### Title: Trend of probability values in a binary choice model
### Aliases: maTrend print.maTrend plot.maTrend
### Keywords: regression

### ** Examples

data(daPe)
ma <- glm(grade ~ gpa + tuce + psi, x = TRUE, 
    data = daPe, family = binomial(link = "probit"))
summary(ma)

(ea <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE))
(ta <- maTrend(q = ea, nam.c = "gpa", simu.c = FALSE))
(tb <- maTrend(q = ea, nam.c = "gpa", nam.d= "psi", simu.c = TRUE, n=100))
plot(ta)
plot(tb)



