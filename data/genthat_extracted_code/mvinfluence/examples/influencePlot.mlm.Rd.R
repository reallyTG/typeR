library(mvinfluence)


### Name: influencePlot.mlm
### Title: Influence Plots for Multivariate Linear Models
### Aliases: influencePlot.mlm
### Keywords: models regression multivariate

### ** Examples

data(Rohwer, package="heplots")
Rohwer2 <- subset(Rohwer, subset=group==2)
Rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n+s+ns+na+ss, data=Rohwer2)

influencePlot(Rohwer.mod, id.n=4, type="stres")
influencePlot(Rohwer.mod, id.n=4, type="LR")
influencePlot(Rohwer.mod, id.n=4, type="cookd")

# Sake data
data(Sake, package="heplots")
	Sake.mod <- lm(cbind(taste,smell) ~ ., data=Sake)
	influencePlot(Sake.mod, id.n=3, type="stres")
	influencePlot(Sake.mod, id.n=3, type="LR")
	influencePlot(Sake.mod, id.n=3, type="cookd")

# Adopted data	
data(Adopted, package="heplots")
	Adopted.mod <- lm(cbind(Age2IQ, Age4IQ, Age8IQ, Age13IQ) ~ AMED + BMIQ, data=Adopted)
  influencePlot(Adopted.mod, id.n=3)
	influencePlot(Adopted.mod, id.n=3, type="LR", ylim=c(-4,-1.5))




