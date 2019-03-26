
library("mlt")
library("sandwich")
set.seed(29)

### Nadja Klein
dat <- data.frame(matrix(rnorm(300),ncol=3))
names(dat) <- c("y","x1","x2")
### set-up conditional transformation model for conditional
y <- numeric_var("y", support = c(min(dat$y), max(dat$y)), bounds = c(-Inf, Inf))
x1 <- numeric_var("x1", support = c(min(dat$x1), max(dat$x1)), bounds = c(-Inf, Inf)) 
x2 <- numeric_var("x2", support = c(min(dat$x2), max(dat$x2)), bounds = c(-Inf, Inf)) 
ctmm2 <- ctm(response = Bernstein_basis(y, order = 4, ui = "increasing"),
              interacting = c(x1=Bernstein_basis(x1, order = 3),
                              x2=Bernstein_basis(x2, order= 3)))
### fit model
mltm2 <- mlt(ctmm2, data = dat, scale = TRUE)
(p <- predict(mltm2, newdata = data.frame(x1=0, x2 = 0), q = mkgrid(mltm2, n = 10)[["y"]]))
### plot data
plot(mltm2,newdata=expand.grid(x1=0:1, x2 = 0:1))

### check update
dist <- numeric_var("dist", support = c(2.0, 100), bounds = c(0, Inf))
speed <- numeric_var("speed", support = c(5.0, 23), bounds = c(0, Inf)) 
ctmm <- ctm(response = Bernstein_basis(dist, order = 4, ui = "increasing"),
            interacting = Bernstein_basis(speed, order = 3))

m <- mlt(ctmm, data = cars)
e <- estfun(m)
w <- runif(nrow(cars)) < .8
m1 <- update(m, weights = w, theta = coef(m))
e1 <- estfun(m1, parm = coef(m))
stopifnot(max(abs(e * w - e1)) < .Machine$double.eps)
e1 <- estfun(m1)
m2 <- mlt(ctmm, data = cars[w > 0,], theta = coef(m))
stopifnot(isTRUE(all.equal(logLik(m1), logLik(m2))))
stopifnot(isTRUE(all.equal(logLik(m1, coef(m2)), logLik(m2, coef(m1)))))
e2 <- estfun(m2, parm = coef(m1))
stopifnot(max(abs(e1[w > 0,] - e2)) < .Machine$double.eps)

### Muriel Buri
data("bodyfat", package = "TH.data")
set.seed(29)

y <- numeric_var("DEXfat", support = c(15, 45), bounds = c(10, 64))
basis_y <- Bernstein_basis(y, order = 2, ui = "incre")
x <- names(bodyfat)[-2]
xfm <- as.formula(paste("~", x, collapse = "+"))
m <- ctm(basis_y, shift = xfm, data = bodyfat)
mod <- mlt(m, data = bodyfat, scale = TRUE, checkGrad = FALSE)
summary(mod)

### parm can be a matrix with subject-specific parameters
parm <- matrix(coef(mod), nrow = 1L)
parm <- parm[rep(1, NROW(bodyfat)),]
all.equal(logLik(mod), logLik(mod, parm = parm))
all.equal(estfun(mod), estfun(mod, parm = parm))

### check for only left/right censoring before fitting
y <- bodyfat$DEXfat
sF <- rep(FALSE, length(y))
library("survival")
bodyfat$DEXfat <- Surv(y, sF)
mod <- mlt(m, data = bodyfat, scale = TRUE, checkGrad = FALSE)
mod$convergence


### just in case: check for new intercept_basis (basefun 0.0-39)
d <- data.frame(y = rnorm(100, mean = 2, sd = .25))
m <- ctm(as.basis(~ y, data = d, remove_intercept = TRUE, ui = matrix(1), ci = 0), 
         shifting = intercept_basis(), todistr = "Normal")
f <- mlt(m, data = d, scale = TRUE)

m2 <- ctm(as.basis(~ y, data = d, ui = matrix(c(0, 1), nr = 1), ci = 0), todistr = "Normal")
f2 <- mlt(m2, data = d, scale = TRUE)
stopifnot(all.equal(coef(f), coef(f2)[2:1]))
stopifnot(all.equal(logLik(f), logLik(f2)))
stopifnot(all.equal(estfun(f), estfun(f2)[,2:1]))

### new shortcut
x <- rnorm(100)
stopifnot(all.equal(mlt:::.Normal()$dd2d(x), 
                    mlt:::.Normal()$dd(x) / mlt:::.Normal()$d(x)))
stopifnot(all.equal(mlt:::.Logistic()$dd2d(x), 
                    mlt:::.Logistic()$dd(x) / mlt:::.Logistic()$d(x)))
stopifnot(all.equal(mlt:::.MinExtrVal()$dd2d(x), 
                    mlt:::.MinExtrVal()$dd(x) / mlt:::.MinExtrVal()$d(x)))

### multiple fixed parameters
y <- rnorm(100)
x <- runif(100)
d <- data.frame(y = y, x = x)
m <- ctm(as.basis(~ y, data = d, ui = matrix(c(0, 1), nr = 1), ci = 0),
         shifting = ~ x, data = d)
cf <- coef(mlt(m, data = d, fixed = c("x" = 1, "(Intercept)" = .5)))
stopifnot(all.equal(cf[c("(Intercept)", "x")], 
                    c("(Intercept)" = .5, "x" = 1)))
