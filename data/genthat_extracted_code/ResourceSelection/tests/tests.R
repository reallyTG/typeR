#devtools::install_github("psolymos/ResourceSelection")
library(ResourceSelection)

## --- run examples with \dontrun sections ---

help_pages <- c("CAIC", "goats", "hoslem.test", "kdepairs",
    "makeUsedAvail", "rsf", "simulateUsedAvail", "mep")

for (i in help_pages) {
    cat("\n\n---------- ResourceSelection example:", i, "----------\n\n")
    eval(parse(text=paste0("example(", i,
        ", package = 'ResourceSelection', run.dontrun = TRUE)")))
}

## --- test methods ---

## settings
n.used <- 1000
m <- 10
n <- n.used * m
set.seed(1234)
x <- data.frame(x1=rnorm(n), x2=runif(n))
cfs <- c(1.5,-1,0.5)
dat1 <- simulateUsedAvail(x, cfs, n.used, m, link="log")
m0 <- rsf.null(dat1$status, m=0)
m1 <- rsf(status ~ .-status, dat1, m=0, B=0)
m1b <- rsf(status ~ .-status, dat1, m=0, B=9)
dat2 <- simulateUsedAvail(x, cfs, n.used, m, link="logit")
m2 <- rspf(status ~ .-status, dat2, m=0, B=0)
m2b <- rspf(status ~ .-status, dat2, m=0, B=9)

print(m0)
print(m1)
print(m1b)
print(m2)
print(m2b)

summary(m0)
summary(m1)
summary(m1b)
summary(m2)
summary(m2b)

CAIC(m0, m1, m2)

family(m1)
family(m2)

coef(m0)
coef(m1)
coef(m2)

vcov(m0)
vcov(m1)
vcov(m1b)
vcov(m2)
vcov(m2b)

str(predict(m1, se.fit = FALSE))
str(predict(m1b, se.fit = FALSE))
str(predict(m2, se.fit = FALSE))
str(predict(m2b, se.fit = FALSE))

str(predict(m1, se.fit = FALSE, newdata = dat1))
str(predict(m1b, se.fit = FALSE, newdata = dat1))
str(predict(m2, se.fit = FALSE, newdata = dat1))
str(predict(m2b, se.fit = FALSE, newdata = dat1))

## cannot provide prediction Std Error without Bootstrap
tmp <- try(predict(m1, se.fit = TRUE))
stopifnot(inherits(tmp, "try-error"))
tmp <- try(predict(m2, se.fit = TRUE))
stopifnot(inherits(tmp, "try-error"))
tmp <- try(predict(m1, se.fit = TRUE, newdata = dat1))
stopifnot(inherits(tmp, "try-error"))
tmp <- try(predict(m2, se.fit = TRUE, newdata = dat1))
stopifnot(inherits(tmp, "try-error"))

str(predict(m1b, se.fit = TRUE))
str(predict(m2b, se.fit = TRUE))
str(predict(m1b, se.fit = TRUE, newdata = dat1))
str(predict(m2b, se.fit = TRUE, newdata = dat1))

confint(m0)
confint(m1)
confint(m1b)
confint(m2)
confint(m2b)

str(model.matrix(m1))
str(model.matrix(m2))

str(model.frame(m1))
str(model.frame(m2))

logLik(m0)
logLik(m1)
logLik(m2)

kdepairs(m1)
kdepairs(m2)

str(fitted(m1))
str(fitted(m2))

str(residuals(m1))
str(residuals(m2))

## test no-selection model
f <- function(n=100, m=10) {
    y <- c(rep(1, n), rep(0, n*m))
    c(data=log(sum(y==1)/sum(y==0)),
        rsf=rsf.null(y, m=0)$results$par,
        glm=unname(coef(glm(y ~ 1, family=binomial))))

}
vals <- expand.grid(n=c(100, 200, 500), m=c(1,10,20))
tst <- t(apply(vals, 1, function(z) f(z[1], z[2])))
data.frame(vals, round(tst, 4))
