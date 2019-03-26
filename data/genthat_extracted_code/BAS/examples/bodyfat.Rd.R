library(BAS)


### Name: bodyfat
### Title: Bodyfat Data
### Aliases: bodyfat Bodyfat
### Keywords: datasets

### ** Examples


data(bodyfat)
bodyfat.bas = bas.lm(Bodyfat ~ Abdomen, data=bodyfat, prior="ZS-null")
summary(bodyfat.bas)
plot(Bodyfat ~ Abdomen, data=bodyfat, xlab="abdomen circumference (cm)")
betas = coef(bodyfat.bas)$postmean   # current version has that intercept is ybar
betas[1] = betas[1] - betas[2]*bodyfat.bas$mean.x
abline(betas)
abline(coef(lm(Bodyfat ~ Abdomen, data=bodyfat)), col=2, lty=2)




