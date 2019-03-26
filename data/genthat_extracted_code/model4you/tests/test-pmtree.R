library("model4you")
library("survival")

### survreg
set.seed(1)
data(GBSG2, package = "TH.data")

## base model
bmod <- survreg(Surv(time, cens) ~ horTh, data = GBSG2, model = TRUE)
survreg_plot(bmod)

## partitioned model
tr <- pmtree(bmod)
plot(tr, terminal_panel = node_pmterminal(tr, plotfun = survreg_plot,
                                          confint = TRUE))
summary(tr)
summary(tr, node = 1:2)

coef(tr)
coef(tr, node = 1)
coef(bmod)

logLik(bmod)
logLik(tr)


### glm binomial
set.seed(2)
n <- 1000
trt <- factor(rep(1:2, each = n/2))
age <- sample(40:60, size = n, replace = TRUE)
eff <- -1 + I(trt == 2) + 1 * I(trt == 2) * I(age > 50)
expit <- function(x) 1/(1 + exp(-x))

success <- rbinom(n = n, size = 1, prob = expit(eff))

dat <- data.frame(success, trt, age)
library("plyr")
dattab <- ddply(.data = dat, .variables = .(trt, age),
                function(x) data.frame(nsuccess = sum(x$success),
                                       nfailure = NROW(x) - sum(x$success)))

bmod1 <- glm(success ~ trt, family = binomial)
bmod2 <- glm(success ~ trt, family = "binomial")
bmod3 <- glm(success ~ trt, data = dat, family = binomial)
bmod4 <- glm(cbind(nsuccess, nfailure) ~ trt, data = dattab, family = binomial)

(tr1 <- pmtree(bmod1, data = dat))
(tr2 <- pmtree(bmod2, data = dat))
(tr3 <- pmtree(bmod3))
(tr4 <- pmtree(bmod4))

(mtr1 <- glmtree(success ~ trt | age, data = dat, family = binomial))
# (mtr2 <- glmtree(cbind(nsuccess, nfailure) ~ trt | age, data = dattab, family = binomial))

library("strucchange")
sctest(tr3)
sctest(tr4)

## check logLik
logLik(mtr1)
logLik(tr1)

sum(objfun(tr1, newdata = dat))
objfun(tr1, newdata = dat, sum = TRUE)
sum(objfun(tr1))
objfun(tr1, sum = TRUE)


## variable importance
logLik(tr1)
logLik(tr1, perm = "age")
a1 <- predict.party(tr1, perm = "age", type = "node")
a2 <- predict(tr1, perm = "age", type = "node")
a3 <- predict(tr1, perm = 3, type = "node")
b <- predict.party(tr1, type = "node")
varimp(tr1, nperm = 5)


library("ggplot2")
ofs <- data.frame(objfun_bmod1 = objfun(bmod1),
                  objfun_tr1 = objfun(tr1))
ggplot(ofs, aes(objfun_bmod1, objfun_tr1)) + geom_jitter(alpha = 0.3)



### linear model and missings
data("MathExam14W", package = "psychotools")

## scale points achieved to [0, 100] percent
MathExam14W$tests <- 100 * MathExam14W$tests/26
MathExam14W$pcorrect <- 100 * MathExam14W$nsolved/13

## select variables to be used
MathExam <- MathExam14W[ , c("pcorrect", "group", "tests", "study",
                             "attempt", "semester", "gender")]

## compute base model
bmod_math <- lm(pcorrect ~ group, data = MathExam)

## compute tree
(tr_math <- pmtree(bmod_math, control = ctree_control(maxdepth = 2)))

## create data with NAs
Math_mx <- Math_mz <- MathExam
Math_mx$group[1:2] <- NA
Math_mz$tests[1:20] <- NA

bmod_math_mx <- lm(pcorrect ~ group, data = Math_mx)

(tr_math_mx1 <- pmtree(bmod_math, control = ctree_control(maxdepth = 2), data = Math_mx))
(tr_math_mx2 <- pmtree(bmod_math_mx, control = ctree_control(maxdepth = 2)))
(tr_math_mz <- pmtree(bmod_math, control = ctree_control(maxdepth = 2), data = Math_mz))


## check logLik
(tr_math_mob <- lmtree(pcorrect ~  group | ., data = MathExam, maxdepth = 2))

logLik(bmod_math)
logLik(tr_math)
logLik(tr_math_mob)

sum(bmod_math$residuals^2)

## varimp
of <- function(x, newdata = NULL, weights = NULL,
               perm = NULL, ...) {
  - objfun(x, newdata = newdata, weights = weights, perm = perm, sum = TRUE, ...)
}
varimp(tr_math, nperm = 2, risk = of)

# deeper tree
w <- rep(1, nrow(Math_mx))
w[5:100] <- 0
tr_math_d <- pmtree(bmod_math, data = Math_mx, weights = w,
                    control = ctree_control(alpha = 0.7))
varimp(tr_math_d, risk = of)


### check different formulas
set.seed(1212)
n <- 90
d1 <- d2 <- d3 <- data.frame(y = abs(rnorm(n) + 5), x = 1:n - 10,
  trt = rep(1:3, each = n/3), z1 = rnorm(n))
d2$trt <- factor(d2$trt)
d3$trt <- ordered(d3$trt)

f <- list(
  y ~ 1,
  y ~ x,
  y ~ trt,
  y ~ trt + x,
  y ~ trt + offset(x),
  y ~ trt + x + offset(x),
  y ~ trt + offset(as.numeric(trt)),
  y ~ factor(trt),
  y ~ factor(trt) + offset(x),
  y ~ factor(x > as.numeric(trt)),
  y ~ interaction(x, trt),
  y ~ 0 + trt
)

try_pmtree <- function(bmod, data) {
  # try(pmtree(bmod, data = data))
  "pmtree" %in% class(try(pmtree(bmod, data = data), silent = TRUE))
}

run_lm <- function(formula, data, ...) {
  eval(substitute(lm(fm, data = data, ...), list(fm = formula)))
}

run_survreg <- function(formula, data, ...) {
  eval(substitute(survreg(fm, data = data, ...), list(fm = formula)))
}

run_coxph <- function(formula, data, ...) {
  eval(substitute(coxph(fm, data = data, ...), list(fm = formula)))
}

## expected results
ok1 <- list(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE)
ok2 <- list(FALSE, FALSE, TRUE,  FALSE, TRUE,  FALSE, TRUE,  TRUE, TRUE, TRUE, TRUE, TRUE)
ok3 <- ok2


## checks with lm
lm1 <- lapply(f, run_lm, data = d1, model = FALSE)
identical(lapply(lm1, try_pmtree, data = d1), ok1)

lm2 <- lapply(f, run_lm, data = d2, model = FALSE)
identical(lapply(lm2, try_pmtree, data = d2), ok2)

lm3 <- lapply(f, run_lm, data = d3, model = FALSE)
identical(lapply(lm3, try_pmtree, data = d3), ok3)

## checks with survreg
library("survival")
d1$y <- d2$y <- d3$y <- Surv(d1$y + 0.5)

survreg1 <- lapply(f, run_survreg, data = d1, model = FALSE)
identical(lapply(survreg1, try_pmtree, data = d1), ok1)

survreg2 <- lapply(f, run_survreg, data = d2, model = FALSE)
identical(lapply(survreg2, try_pmtree, data = d2), ok2)

survreg3 <- lapply(f, run_survreg, data = d3, model = FALSE)
identical(lapply(survreg3, try_pmtree, data = d3), ok3)



## checks with coxph
coxph1 <- lapply(f, run_coxph, data = d1, model = FALSE)
identical(lapply(coxph1, try_pmtree, data = d1), ok1)

coxph2 <- lapply(f, run_coxph, data = d2, model = FALSE)
identical(lapply(coxph2, try_pmtree, data = d2), ok2)

coxph3 <- lapply(f, run_coxph, data = d3, model = FALSE)
identical(lapply(coxph3, try_pmtree, data = d3), ok3)


