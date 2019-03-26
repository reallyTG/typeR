library(heplots)


### Name: gsorth
### Title: Orthogonalize successive columns of a data frame or matrix
### Aliases: gsorth
### Keywords: manip

### ** Examples

GSiris <- gsorth(iris[,1:4])
GSiris <- gsorth(iris, order=1:4)   # same, using order
str(GSiris)
zapsmall(cor(GSiris))
colMeans(GSiris)
# sd(GSiris) -- sd(<matrix>) now deprecated
apply(GSiris, 2, sd)

# orthogonalize Y side
GSiris <- data.frame(gsorth(iris[,1:4]), Species=iris$Species)
iris.mod1 <- lm(as.matrix(GSiris[,1:4]) ~ Species, data=GSiris)
Anova(iris.mod1)

# orthogonalize X side
rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n + s + ns + na + ss, data=Rohwer)
Anova(rohwer.mod)

# type I tests for Rohwer data
Rohwer.orth <- cbind(Rohwer[,1:5], gsorth(Rohwer[, c("n", "s", "ns", "na", "ss")], adjnames=FALSE))

rohwer.mod1 <- lm(cbind(SAT, PPVT, Raven) ~ n + s + ns + na + ss, data=Rohwer.orth)
Anova(rohwer.mod1)
# compare with anova()
anova(rohwer.mod1)

# compare heplots for original Xs and orthogonalized, Type I
heplot(rohwer.mod)
heplot(rohwer.mod1)




