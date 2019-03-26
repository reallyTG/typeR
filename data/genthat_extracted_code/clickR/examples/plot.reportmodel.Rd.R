library(clickR)


### Name: plot.reportmodel
### Title: Coefplot for reportmodel objects
### Aliases: plot.reportmodel

### ** Examples

lm1 <- lm(Petal.Length ~ Sepal.Width + Species, data=iris)
a<-report(lm1)
par(mar=c(4, 10, 3, 2))
plot(a)   #Coefplot calling plot.reportmodel



