## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
tidy=FALSE,fig.width=5,fig.height=5,cache=FALSE
)

## ----echo=FALSE, results='hide', include=FALSE---------------------------
#options(continue="+    ", prompt="R> ", width=76)
options(show.signif.stars=FALSE)
options(scipen=3)

## ------------------------------------------------------------------------
mvrunif <- function(n, R, min = 0, max = 1){
    # method (but not code) from E. Schumann,
    # "Generating Correlated Uniform Variates"
    # URL:
    # <http://comisef.wikidot.com/tutorial:correlateduniformvariates>
    # downloaded 2015-05-21
    if (!is.matrix(R) || nrow(R) != ncol(R) ||
    max(abs(R - t(R))) > sqrt(.Machine$double.eps))
    stop("R must be a square symmetric matrix")
    if (any(eigen(R, only.values = TRUE)$values <= 0))
    stop("R must be positive-definite")
    if (any(abs(R) - 1 > sqrt(.Machine$double.eps)))
    stop("R must be a correlation matrix")
    m <- nrow(R)
    R <- 2 * sin(pi * R / 6)
    X <- matrix(rnorm(n * m), n, m)
    X <- X %*% chol(R)
    X <- pnorm(X)
    min + X * (max - min)
}

gendata <- function(n = 5000, R, min = -2, max = 2, s = 1.5,
    model = expression(x1 + x2 + x3)){
    data <- mvrunif(n = n, min = min, max = max, R = R)
    colnames(data) <- c("x1", "x2", "x3")
    data <- as.data.frame(data)
    data$error <- s * rnorm(n)
    data$y <- with(data, eval(model) + error)
    data
}

R <- function(offdiag = 0, m = 3){
    R <- diag(1, m)
    R[lower.tri(R)] <- R[upper.tri(R)] <- offdiag
    R
}

## ------------------------------------------------------------------------
set.seed(682626)
Data.1 <- gendata(R = R(0), model = expression(x1 + x2 * x3))
round(cor(Data.1), 2)
summary(mod.1 <- lm(y ~ x1 + x2 + x3, data = Data.1))

## ----fig-contrived-1a,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
library(effects)
plot(predictorEffects(mod.1, partial.residuals=TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     rows=1, cols=3)

## ----fig-contrived-1b,include=TRUE, fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x2", "x3"), mod.1, partial.residuals = TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     lattice=list(layout=c(4, 1)))

## ----fig-contrived-1c,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x1", "x2"), mod.1, partial.residuals = TRUE),
    partial.residual=list(pch=".", col="#FF00FF80"),
    axes=list(x=list(rotate=45)),
    lattice=list(layout=c(4, 1)))

## ------------------------------------------------------------------------
set.seed(682626)
Data.2 <- gendata(R = R(0.5), model = expression(x1 + x2 * x3))
mod.2 <- lm(y ~ x1 + x2 + x3, data = Data.2)

## ----fig-contrived-2a,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(predictorEffects(mod.2, partial.residuals=TRUE),
     partial.residual=list(pch=".", col="#FF00FF80",fig.show='hide'),
     axes=list(x=list(rotate=45)),
     rows=1, cols=3)

## ----fig-contrived-2b,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x2", "x3"), mod.2, partial.residuals = TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     lattice=list(layout=c(4, 1)))

## ----fig-contrived-2c,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x1", "x2"), mod.2, partial.residuals = TRUE),
    partial.residual=list(pch=".", col="#FF00FF80",fig.show='hide'),
    axes=list(x=list(rotate=45)),
    lattice=list(layout=c(4, 1)))

## ------------------------------------------------------------------------
set.seed(682626)
Data.3 <- gendata(R = R(0.5), model = expression(x1^2 + x2 + x3))
mod.3 <- lm(y ~ x1 + x2 + x3, data = Data.3)

## ----fig-contrived-3a,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(predictorEffects(mod.3, partial.residuals=TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     rows=1, cols=3)

## ----fig-contrived-3b,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x2", "x3"), mod.3, partial.residuals = TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     lattice=list(layout=c(4, 1)))

## ----fig-contrived-3c,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x1", "x2"), mod.3, partial.residuals = TRUE),
    partial.residual=list(pch=".", col="#FF00FF80"),
    axes=list(x=list(rotate=45)),
    lattice=list(layout=c(4, 1)))

## ------------------------------------------------------------------------
set.seed(682626)
Data.4 <- gendata(R = R(0.5), model = expression(x1^2 + x2 * x3))
mod.4 <- lm(y ~ x1 + x2 + x3, data = Data.4)

## ----fig-contrived-4a,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(predictorEffects(mod.4, partial.residuals=TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     rows=1, cols=3)

## ----fig-contrived-4b,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x2", "x3"), mod.4, partial.residuals = TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
      axes=list(x=list(rotate=45)),
     lattice=list(layout=c(4, 1)))

## ----fig-contrived-4c,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x1", "x2"), mod.4, partial.residuals = TRUE),
    partial.residual=list(pch=".", col="#FF00FF80"),
    axes=list(x=list(rotate=45)),
    lattice=list(layout=c(4, 1)))

## ----fig-contrived-5a,include=TRUE,fig.width=5,fig.height=4,fig.show='hide'----
mod.5 <- lm(y ~ poly(x1, 2) + x2*x3, data=Data.4)
plot(Effect("x1", mod.5, partial.residuals=TRUE),
     partial.residual=list(pch=".", col="#FF00FF80", span=0.2))

## ----fig-contrived-5b,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x2", "x3"), mod.5, partial.residuals = TRUE),
     partial.residual=list(pch=".", col="#FF00FF80"),
     axes=list(x=list(rotate=45)),
     lattice=list(layout=c(4, 1)), span=0.5)

## ----fig-contrived-5c,include=TRUE,fig.width=12,fig.height=4,fig.show='hide'----
plot(Effect(c("x1", "x2"), mod.5, partial.residuals = TRUE),
    partial.residual=list(pch=".", col="#FF00FF80", span=0.35),
    axes=list(x=list(rotate=45)),
    lattice=list(layout=c(4, 1)))

