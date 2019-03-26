library("partykit")


## artificial data ---------------------------------------------------------------------------------
set.seed(0)
d <- data.frame(x = seq(-1, 1, length.out = 1000), z = factor(rep(0:1, 500)))
d$y <- 0 + 1 * d$x + rnorm(nrow(d))
d$w <- rep(1:4, nrow(d)/4)
dd <- d[rep(1:nrow(d), d$w), ]


## convenience function: likelihood ratio test -----------------------------------------------------
lrtest <- function(data, ...) {
  lr <- -2 * (logLik(lm(y ~ x, data = data, ...)) - logLik(lm(y ~ x * z, data = data, ...)))
  matrix(
    c(lr, pchisq(lr, df = 2, lower.tail = FALSE)),
    dimnames = list(c("statistic", "p.value"), "z")
  )
}


## lm: case weights --------------------------------------------------------------------------------

## weighted and explicitly expanded data should match exactly
lm1 <- lmtree(y ~ x | z, data = d, weights = w, maxdepth = 2)
lm2 <- lmtree(y ~ x | z, data = dd, maxdepth = 2)
all.equal(sctest.modelparty(lm1), sctest.modelparty(lm2))

## LR test should be similar (albeit not identical)
all.equal(sctest.modelparty(lm1), lrtest(dd), tol = 0.05)


## lm: proportionality weights ---------------------------------------------------------------------

## LR test should be similar
lm3 <- lmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, caseweights = FALSE)
all.equal(sctest.modelparty(lm3), lrtest(d, weights = d$w), tol = 0.05)

## constant factor should not change results
lm3x <- lmtree(y ~ x | z, data = d, weights = 2 * w, maxdepth = 2, caseweights = FALSE)
all.equal(sctest.modelparty(lm3), sctest.modelparty(lm3x))


## glm: case weights -------------------------------------------------------------------------------

## for glm different vcov are available
glm1o <- glmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, vcov = "opg")
glm2o <- glmtree(y ~ x | z, data = dd, maxdepth = 2, vcov = "opg")
all.equal(sctest.modelparty(glm1o), sctest.modelparty(glm1o))

glm1i <- glmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, vcov = "info")
glm2i <- glmtree(y ~ x | z, data = dd, maxdepth = 2, vcov = "info")
all.equal(sctest.modelparty(glm1i), sctest.modelparty(glm2i))

glm1s <- glmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, vcov = "sandwich")
glm2s <- glmtree(y ~ x | z, data = dd, maxdepth = 2, vcov = "sandwich")
all.equal(sctest.modelparty(glm1s), sctest.modelparty(glm2s))

## different vcov should yield similar (albeit not identical) statistics
all.equal(sctest.modelparty(glm1o), sctest.modelparty(glm1i), tol = 0.05)
all.equal(sctest.modelparty(glm1o), sctest.modelparty(glm1s), tol = 0.05)

## LR test should be similar
all.equal(sctest.modelparty(glm1o), lrtest(dd), tol = 0.05)


## glm: proportionality weights --------------------------------------------------------------------

## different test versions should be similar
glmFo <- glmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, caseweights = FALSE, vcov = "opg")
glmFi <- glmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, caseweights = FALSE, vcov = "info")
glmFs <- glmtree(y ~ x | z, data = d, weights = w, maxdepth = 2, caseweights = FALSE, vcov = "sandwich")

all.equal(sctest.modelparty(glmFo), sctest.modelparty(glmFi), tol = 0.05)
all.equal(sctest.modelparty(glmFo), sctest.modelparty(glmFs), tol = 0.05)
all.equal(sctest.modelparty(glmFo), lrtest(d, weights = d$w), tol = 0.05)

## constant factor should not change results
glmFxo <- glmtree(y ~ x | z, data = d, weights = 2 * w, maxdepth = 2, caseweights = FALSE, vcov = "opg")
glmFxi <- glmtree(y ~ x | z, data = d, weights = 2 * w, maxdepth = 2, caseweights = FALSE, vcov = "info")
glmFxs <- glmtree(y ~ x | z, data = d, weights = 2 * w, maxdepth = 2, caseweights = FALSE, vcov = "sandwich")

all.equal(sctest.modelparty(glmFo), sctest.modelparty(glmFxo))
all.equal(sctest.modelparty(glmFi), sctest.modelparty(glmFxi))
all.equal(sctest.modelparty(glmFs), sctest.modelparty(glmFxs))
