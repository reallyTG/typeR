library(clickR)


### Name: coefplot
### Title: Plot of the coefficients of a model
### Aliases: coefplot

### ** Examples

lm1 <- lm(Petal.Length ~ Sepal.Width + Species, data=iris)
a<-report(lm1)
par(mar=c(4, 10, 3, 2))
#Coefplot calling plot.reportmodel
plot(a)
#Manual coefplot
coefplot(coefs=c(1, 2, 3), lwr.int=c(0, 1, 2), upper.int=c(5, 6, 7), coefnames=c("A", "B", "C"))



