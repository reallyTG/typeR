library(plotrix)


### Name: ehplot
### Title: Engelmann-Hecker-Plot - EH-Plot
### Aliases: ehplot
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(iris)
ehplot(iris$Sepal.Length, iris$Species, intervals=20, cex=1.8, pch=20)
ehplot(iris$Sepal.Width, iris$Species, intervals=20, box=TRUE, median=FALSE)
ehplot(iris$Petal.Length, iris$Species, pch=17, col="red", log=TRUE)
ehplot(iris$Petal.Length, iris$Species, offset=0.06, pch=as.numeric(iris$Species))

# Groups don't have to be presorted:
rnd <- sample(150)
plen <- iris$Petal.Length[rnd]
pwid <- abs(rnorm(150, 1.2))
spec <- iris$Species[rnd]
ehplot(plen, spec, pch=19, cex=pwid, col=rainbow(3, alpha=0.6)[as.numeric(spec)])



