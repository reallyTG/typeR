library(car)


### Name: ScatterplotSmoothers
### Title: Smoothers to Draw Lines on Scatterplots
### Aliases: ScatterplotSmoothers gamLine quantregLine loessLine
### Keywords: hplot

### ** Examples

scatterplot(prestige ~ income, data=Prestige)
scatterplot(prestige ~ income, data=Prestige, smooth=list(smoother=gamLine))
scatterplot(prestige ~ income, data=Prestige,
    smooth=list(smoother=quantregLine))

scatterplot(prestige ~ income | type, data=Prestige)
scatterplot(prestige ~ income | type, data=Prestige,
    smooth=list(smoother=gamLine))
scatterplot(prestige ~ income | type, data=Prestige,
    smooth=list(smoother=quantregLine))
scatterplot(prestige ~ income | type, data=Prestige, smooth=FALSE)

scatterplot(prestige ~ income | type, data=Prestige, spread=TRUE)
scatterplot(prestige ~ income | type, data=Prestige,
    smooth=list(smoother=gamLine), spread=TRUE)
scatterplot(prestige ~ income | type, data=Prestige,
    smooth=list(smoother=quantregLine), spread=TRUE)

scatterplot(weight ~ repwt | sex, spread=TRUE, data=Davis,
    smooth=list(smoother=loessLine))
scatterplot(weight ~ repwt | sex, spread=TRUE, data=Davis,
    smooth=list(smoother=gamLine)) # messes up
scatterplot(weight ~ repwt | sex, spread=TRUE, data=Davis,
    smooth=list(smoother=quantregLine)) #  robust

set.seed(12345)
w <- 1 + rpois(100, 5)
x <- rnorm(100)
p <- 1/(1 + exp(-(x + 0.5*x^2)))
y <- rbinom(100, w, p)
scatterplot(y/w ~ x, smooth=list(smoother=gamLine, family="binomial",
    weights=w))
scatterplot(y/w ~ x, smooth=list(smoother=gamLine, family=binomial,
    link="probit", weights=w))
scatterplot(y/w ~ x, smooth=list(smoother=loessLine), reg=FALSE)

y <- rbinom(100, 1, p)
scatterplot(y ~ x, smooth=list(smoother=gamLine, family=binomial))



