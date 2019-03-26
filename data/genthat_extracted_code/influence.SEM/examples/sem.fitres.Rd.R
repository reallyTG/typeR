library(influence.SEM)


### Name: sem.fitres
### Title: Fitted values and residuals
### Aliases: sem.fitres obs.fitres lat.fitres
### Keywords: utility

### ** Examples

data("PDII")
model <- "
  F1 =~ y1+y2+y3+y4
"

fit0 <- sem(model, data=PDII)
out <- sem.fitres(fit0)
head(out)

par(mfrow=c(2,2))
plot(e.y1~hat.y1,data=out)
plot(e.y2~hat.y2,data=out)
plot(e.y3~hat.y3,data=out)
plot(e.y4~hat.y4,data=out)

qqnorm(out$e.y1); qqline(out$e.y1)
qqnorm(out$e.y2); qqline(out$e.y2)
qqnorm(out$e.y3); qqline(out$e.y3)
qqnorm(out$e.y4); qqline(out$e.y4)



