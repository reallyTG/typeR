library(quantreg)


### Name: anova.rq
### Title: Anova function for quantile regression fits
### Aliases: anova.rq anova.rqs anova.rqlist print.anova.rq rq.test.rank
###   rq.test.anowar
### Keywords: htest regression robust

### ** Examples

data(barro)
fit0 <- rq(y.net ~  lgdp2 + fse2 + gedy2 , data = barro)
fit1 <- rq(y.net ~  lgdp2 + fse2 + gedy2 + Iy2 + gcony2, data = barro)
fit2 <- rq(y.net ~  lgdp2 + fse2 + gedy2 + Iy2 + gcony2, data = barro,tau=.75)
fit3 <- rq(y.net ~  lgdp2 + fse2 + gedy2 + Iy2 + gcony2, data = barro,tau=.25)
anova(fit1,fit0)
anova(fit1,fit2,fit3)
anova(fit1,fit2,fit3,joint=FALSE)
# Alternatively fitting can be done in one call:
fit <- rq(y.net ~  lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
	  method = "fn", tau = 1:4/5, data = barro)



