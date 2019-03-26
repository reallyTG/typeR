## test handing of weights and offset argument
require(robustbase)

## generate simple example data  (extension of the one in ./NAcoef.R )
data <- expand.grid(x1=letters[1:3], x2=LETTERS[1:4], rep=1:3)
## generate offset column
data$os <- 1:nrow(data)
set.seed(1)
data$y <- data$os + rnorm(nrow(data))
## add collinear variables
data$x3 <- rnorm(nrow(data))
data$x4 <- rnorm(nrow(data))
data$x5 <- data$x3 + data$x4 ## lm() will have 'x5'  "aliased" (and give coef = NA)
## add some NA terms
data$y[1] <- NA
data$x4[2:3] <- NA ## to test anova
## generate weights
## some obs with weight 0
data$weights <- as.numeric(with(data, x1 != 'c' | (x2 != 'B' & x2 != 'C')))
## some obs with weight 2
data$weights[data$x1 == 'b'] <- 2
## data2 := {data + weights}, encoded in "data2" (-> "ok" for coef(), not for SE)
data2 <- rbind(subset(data, weights  > 0),
	       subset(data, weights == 2))
## using these parameters we're essentially forcing lmrob() to
## fit a classic model --> easier to compare to lm()
ctrl <- lmrob.control(psi="optimal", tuning.chi = 20, bb = 0.0003846154,
                      tuning.psi=20, method="SM", cov=".vcov.w")
## SM = MM == the case where  .vcov.avar1  was also defined for

## Classical models start with 'cm', robust just with  'rm' (or just 'm'):
(cm0 <- lm   (y ~ x1*x2 + x3 + x4 + x5 + offset(os), data))
(cm1 <- lm   (y ~ x1*x2 + x3 + x4 + x5 + offset(os), data,  weights=weights))
(cm2 <- lm   (y ~ x1*x2 + x3 + x4 + x5,              data2, offset=os))
(rm0 <- lmrob(y ~ x1*x2 + x3 + x4 + x5 + offset(os), data,                   control=ctrl))
set.seed(2)
(rm1 <- lmrob(y ~ x1*x2 + x3 + x4 + x5 + offset(os), data,  weights=weights, control=ctrl))
set.seed(2)
(rm2 <- lmrob(y ~ x1*x2 + x3 + x4 + x5,              data2, offset=os,       control=ctrl))

sc0 <- summary(cm0)
sc1 <- summary(cm1)
sc2 <- summary(cm2)
(sr0 <- summary(rm0))
(sr1 <- summary(rm1))
(sr2 <- summary(rm2))

## test Estimates, Std. Errors, ...
stopifnot(all.equal(coef(cm1), coef(cm2)),
          all.equal(coef(rm1), coef(rm2)),
          all.equal(coef(sc0), coef(sr0)),
          all.equal(coef(sc1), coef(sr1)),
          all.equal(coef(sc2), coef(sr2)))

## test class "lm" methods that do not depend on weights
meths1 <- c("family",
            "formula",
            "labels",
            "model.matrix",
            "na.action",
            "terms")
for (meth in meths1)
    stopifnot(all.equal(do.call(meth, list(rm0)),
                        do.call(meth, list(rm1))))

## class "lm" methods that depend on weights
##                                      FIXME:
meths2 <- c(#"AIC",
            "alias",
            #"BIC",
            "case.names",
            "coef",
            "confint",
            #"cooks.distance",
            #"deviance",
            "df.residual",
            #"dfbeta",
            #"dfbetas",
            #"drop1",
            "dummy.coef",
            #"effects",
            #"extractAIC",
            #"hatvalues",
            #"influence",
            "kappa",
            #"logLik",
            #"model.frame", ## disable because of zero.weights attribute
            "nobs",
            "predict",
                                        #"proj",
                                        #"rstandard",
                                        #"rstudent",
                                        #"simulate",
            ##"summary", ## see above
            "variable.names",
            ##"vcov",    ## see below
            "weights")
op <- options(warn = 1)# print immediately
for (meth in meths2) {
    cat(meth,":")
    .SW. <- if(meth == "weights") suppressWarnings else identity # for suppressing
    ## No weights defined for this object. Use type="robustness" ....
    stopifnot(all.equal(do.call(meth, list(cm1)),
                        do.call(meth, list(rm1))),
              all.equal(do.call(meth, list(cm2)),
		   .SW.(do.call(meth, list(rm2)))))
    cat("\n")
}
options(op)# reverting

## further tests:
anova(rm1, update(rm1, ~ . - x4 - x5))
anova(rm2, update(rm2, ~ . - x4 - x5))

stopifnot(all.equal(fitted(cm0), fitted(rm0)),
          all.equal(fitted(cm1), fitted(rm1)),
          all.equal(fitted(cm2), fitted(rm2)))

nd <- expand.grid(x1=letters[1:3], x2=LETTERS[1:4])
set.seed(3)
nd$x3 <- rnorm(nrow(nd))
nd$x4 <- rnorm(nrow(nd))
nd$x5 <- rnorm(nrow(nd))
nd$os <- nrow(nd):1
wts   <- runif(nrow(nd))
stopifnot(all.equal(predict(cm0, nd, interval="prediction"),
                    predict(rm0, nd, interval="prediction")),
          all.equal(predict(cm1, nd, interval="prediction"),
                    predict(rm1, nd, interval="prediction")),
          all.equal(predict(cm2, nd, interval="prediction"),
                    predict(rm2, nd, interval="prediction")),
          all.equal(predict(cm0, nd, interval="prediction", weights=wts),
                    predict(rm0, nd, interval="prediction", weights=wts)),
          all.equal(predict(cm1, nd, interval="prediction", weights=wts),
                    predict(rm1, nd, interval="prediction", weights=wts)),
          all.equal(predict(cm2, nd, interval="prediction", weights=wts),
                    predict(rm2, nd, interval="prediction", weights=wts),
                    tolerance=1e-7))

## Padding can lead to differing values here
## so test only full rank part
qrEQ <- function(m1, m2) {
    q1 <- qr(m1)
    q2 <- qr(m2)
    r <- 1:q1$rank
    stopifnot(q1$rank == q2$rank,
              all.equal(q1$pivot, q2$pivot),
              all.equal(q1$qraux[r],q2$qraux[r]),
              all.equal(q1$qr[r,r], q2$qr[r,r]))
}
qrEQ(cm0, rm0)
qrEQ(cm1, rm1)
qrEQ(cm2, rm2)

stopifnot(all.equal(residuals(cm0),             residuals(rm0)),
          all.equal(residuals(cm1),             residuals(rm1)),
          all.equal(residuals(cm2),             residuals(rm2)),
          all.equal(resid(cm0, type="pearson"), resid(rm0, type="pearson")),
          all.equal(resid(cm1, type="pearson"), resid(rm1, type="pearson")),
          all.equal(resid(cm2, type="pearson"), resid(rm2, type="pearson")))

## R 3.5.0:  vcov(*,  complete=TRUE)  new default ==> same NA's as coef()
if(interactive()) withAutoprint({
    op <- options(width = 130, digits = 2) # -->  vcov() rows fit on 1 line
    vcov(cm0) # 'x5' is NA
    vcov(cm2) # 'x5', 'x1c:2B', 'x1c:2C'  rows & columns are NA
    options(op)
})

(no.C <- is.na(match("complete", names(formals(stats:::vcov.lm))))) ## temporary _FIXME_
vcovC <- if(no.C) function(M, ...) vcov(M, complete=FALSE, ...) else vcov # (complete=TRUE)
stopifnot(all.equal(vcov(cm0), vcovC(rm0), check.attributes=FALSE),
          all.equal(vcov(cm1), vcovC(rm1), check.attributes=FALSE),
          all.equal(vcov(cm2), vcovC(rm2), check.attributes=FALSE))

## "clean":
cln <- function(vc) structure(vc, weights=NULL, eigen=NULL)
## .vcov.avar1() is not recommended here, but also should work with singular / NA coef case:
ok0 <- !is.na(coef(rm0))
vr0.NA<- vcov(rm0, cov=".vcov.avar1", complete=NA) # "almost singular" warning
vr0.T <- vcov(rm0, cov=".vcov.avar1", complete=TRUE)
vr0.F <- vcov(rm0, cov=".vcov.avar1", complete=FALSE)
stopifnot(identical(dim(vr0.NA), dim(vr0.T)),
          identical(dim(vr0.F),  dim(vr0.T) - 1L), dim(vr0.F) == 14,
          all.equal(cln(vr0.F), vr0.T[ok0,ok0], tol = 1e-15))

if(!no.C) {
vc0.T <- vcov(cm0, complete=TRUE)
vc0.F <- vcov(cm0, complete=FALSE)
}

ok1 <- !is.na(coef(rm1))
## cannot work because init/fit residuals are not of full length
tools::assertError(vr1.NA<- vcov(rm1, cov=".vcov.avar1", complete=NA))
tools::assertError(vr1.T <- vcov(rm1, cov=".vcov.avar1", complete=TRUE ))
tools::assertError(vr1.F <- vcov(rm1, cov=".vcov.avar1", complete=FALSE))
## instead, must refit
rm1. <- update(rm1, control = within(ctrl,  cov <- ".vcov.avar1"))
vr1.NA<- vcov(rm1., complete=NA)
vr1.T <- vcov(rm1., complete=TRUE)
vr1.F <- vcov(rm1., complete=FALSE)

stopifnot(identical(vr1.F, vr1.NA), # in this case
          identical(dim(vr1.F),  dim(vr1.T) - 3L), dim(vr1.F) == 12, isSymmetric(vr1.T),
          identical(rownames(vr1.F),  rownames(vr1.T)[ok1]),
          all.equal(cln(vr1.F), vr1.T[ok1,ok1], tol=1e-15))

if(FALSE) ## ERROR "exact singular" (probably *NOT* to fix, as TRUE/FALSE do work !)
vr2.NA<- vcov(rm2, cov=".vcov.avar1", complete=NA) # "almost singular" warning
vr2.T <- vcov(rm2, cov=".vcov.avar1", complete=TRUE)
vr2.F <- vcov(rm2, cov=".vcov.avar1", complete=FALSE)
stopifnot(TRUE, # identical(dim(vr2.NA), dim(vr2.T)),
	  identical(dim(vr2.F),  dim(vr2.T) - 3L), dim(vr2.F) == 12,
	  identical(rownames(vr2.F), rownames(vr1.F)),
	  identical(rownames(vr2.T), rownames(vr1.T)),
	  all.equal(cln(vr2.F), vr2.T[ok1,ok1], tol=1e-15))

## Hmm, the supposedly heteroscedastic-robust estimates *are* very different:
all.equal(vcov(cm0), vcovC(rm0, cov = ".vcov.avar1"), check.attributes=FALSE) # rel.diff. 0.5367564
if(FALSE) # does not make sense
all.equal(vcov(cm1), vcovC(rm1, cov = ".vcov.avar1"), check.attributes=FALSE)
all.equal(vcov(cm2), vcovC(rm2, cov = ".vcov.avar1"), check.attributes=FALSE) # rel.diff. 0.5757642


## Null fits (rank(X)==0) are tested in NAcoef.R

## testing weight=0 bug
lmrob(y ~ x3, data, weights=weights)
