library(grouped)


### Name: anova.grouped
### Title: Anova method for grouped objects
### Aliases: anova.grouped
### Keywords: methods

### ** Examples


m1 <- grouped(cbind(lo, up) ~ treat, link = "logit", data = Sdata)
m2 <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
anova(m1, m2)

m1 <- grouped(equispaced(r, n) ~ x1, link = "logit", data = Seeds)
m2 <- grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)
anova(m1, m2)




