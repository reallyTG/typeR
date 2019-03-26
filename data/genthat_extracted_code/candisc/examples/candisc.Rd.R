library(candisc)


### Name: candisc
### Title: Canonical discriminant analysis
### Aliases: candisc candisc.mlm coef.candisc plot.candisc print.candisc
###   summary.candisc
### Keywords: multivariate hplot

### ** Examples

grass.mod <- lm(cbind(N1,N9,N27,N81,N243) ~ Block + Species, data=Grass)
Anova(grass.mod, test="Wilks")

grass.can1 <-candisc(grass.mod, term="Species")
plot(grass.can1)

# library(heplots)
heplot(grass.can1, scale=6, fill=TRUE)

# iris data
iris.mod <- lm(cbind(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) ~ Species, data=iris)
iris.can <- candisc(iris.mod, data=iris)
#-- assign colors and symbols corresponding to species
col <- rep(c("red", "black", "blue"), each=50)
pch <- rep(1:3, each=50)
plot(iris.can, col=col, pch=pch)

heplot(iris.can)

# 1-dim plot
iris.can1 <- candisc(iris.mod, data=iris, ndim=1)
plot(iris.can1)




