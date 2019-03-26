library(lava)


### Name: plotConf
### Title: Plot regression lines
### Aliases: plotConf
### Keywords: hplot, regression

### ** Examples

n <- 100
x0 <- rnorm(n)
x1 <- seq(-3,3, length.out=n)
x2 <- factor(rep(c(1,2),each=n/2), labels=c("A","B"))
y <- 5 + 2*x0 + 0.5*x1 + -1*(x2=="B")*x1 + 0.5*(x2=="B") + rnorm(n, sd=0.25)
dd <- data.frame(y=y, x1=x1, x2=x2)
lm0 <- lm(y ~ x0 + x1*x2, dd)
plotConf(lm0, var1="x1", var2="x2")
abline(a=5,b=0.5,col="red")
abline(a=5.5,b=-0.5,col="red")
### points(5+0.5*x1 -1*(x2=="B")*x1 + 0.5*(x2=="B") ~ x1, cex=2)

data(iris)
l <- lm(Sepal.Length ~ Sepal.Width*Species,iris)
plotConf(l,var2="Species")
plotConf(l,var1="Sepal.Width",var2="Species")

## Not run: 
##D ## lme4 model
##D dd$Id <- rbinom(n, size = 3, prob = 0.3)
##D lmer0 <- lme4::lmer(y ~ x0 + x1*x2 + (1|Id), dd)
##D plotConf(lmer0, var1="x1", var2="x2")
## End(Not run)



