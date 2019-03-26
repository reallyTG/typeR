library(car)


### Name: qqPlot
### Title: Quantile-Comparison Plot
### Aliases: qqPlot qqp qqPlot.default qqPlot.formula qqPlot.lm qqPlot.glm
### Keywords: distribution univar regression

### ** Examples

x<-rchisq(100, df=2)
qqPlot(x)
qqPlot(x, dist="chisq", df=2)

qqPlot(~ income, data=Prestige, subset = type == "prof")
qqPlot(income ~ type, data=Prestige, layout=c(1, 3))

qqPlot(lm(prestige ~ income + education + type, data=Duncan),
	envelope=.99)



