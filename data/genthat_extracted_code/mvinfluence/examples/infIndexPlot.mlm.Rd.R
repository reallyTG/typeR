library(mvinfluence)


### Name: infIndexPlot.mlm
### Title: Influence Index Plots for Multivariate Linear Models
### Aliases: infIndexPlot.mlm influenceIndexPlot
### Keywords: hplot

### ** Examples

# iris data
data(iris)
iris.mod <- lm(as.matrix(iris[,1:4]) ~ Species, data=iris)
infIndexPlot(iris.mod, col=iris$Species, id.n=3)

# Sake data
data(Sake, package="heplots")
Sake.mod <- lm(cbind(taste,smell) ~ ., data=Sake)
infIndexPlot(Sake.mod, id.n=3)

# Rohwer data
data(Rohwer, package="heplots")
Rohwer2 <- subset(Rohwer, subset=group==2)
rownames(Rohwer2)<- 1:nrow(Rohwer2)
rohwer.mlm <- lm(cbind(SAT, PPVT, Raven) ~ n + s + ns + na + ss, data=Rohwer2)
infIndexPlot(rohwer.mlm, id.n=3)




