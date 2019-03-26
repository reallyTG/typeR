library(gmodels)


### Name: estimable
### Title: Contrasts and estimable linear functions of model coefficients
### Aliases: estimable estimable.default estimable.mlm
### Keywords: models regression

### ** Examples

# setup example data
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
levels(x) <- c("A","B","C","D")
x2 <- rnorm(100, mean=y, sd=0.5)

# simple contrast and confidence interval
reg <- lm(y ~ x)
estimable(reg, c(    0,   1,    0,   -1) )  # full coefficient vector
estimable(reg, c("xB"=1,"xD"=-1) )          # just the nonzero terms


# Fit a spline with a single knot at 0.5 and plot the *pointwise*
# confidence intervals
library(gplots)
pm <- pmax(x2-0.5, 0) # knot at 0.5
reg2 <- lm(y ~ x + x2 + pm )

range <- seq(-2, 2, , 50)
tmp <- estimable(reg2,
                 cm=cbind(
                          '(Intercept)'=1,
                          'xC'=1,
                          'x2'=range,
                          'pm'=pmax(range-0.5, 0)
                           ),
                 conf.int=0.95)
plotCI(x=range, y=tmp[, 1], li=tmp[, 6], ui=tmp[, 7])

# Fit both linear and quasi-Poisson models to iris data, then compute
# joint confidence intervals on contrasts for the Species and
# Sepal.Width by Species interaction terms.
data(iris)
lm1  <- lm (Sepal.Length ~ Sepal.Width + Species + Sepal.Width:Species, data=iris)
glm1 <- glm(Sepal.Length ~ Sepal.Width + Species + Sepal.Width:Species, data=iris,
            family=quasipoisson("identity"))

cm <- rbind(
            'Setosa vs. Versicolor'   = c(0, 0, 1, 0, 1, 0),
            'Setosa vs. Virginica'    = c(0, 0, 0, 1, 0, 1),
            'Versicolor vs. Virginica'= c(0, 0, 1,-1, 1,-1)
            )
estimable(lm1, cm)
estimable(glm1, cm)



