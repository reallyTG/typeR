library(survMisc)


### Name: ten
### Title: *t*ime, *e*vent(s) and *n*umber at risk.
### Aliases: ten ten.numeric ten.Surv ten.coxph ten.survfit ten.formula
###   ten.data.frame ten.data.table ten.ten

### ** Examples

require("survival")
## binary vector
ten(c(1, 0, 1, 0, 1))

## Surv object
df0 <- data.frame(t=c(1, 1, 2, 3, 5, 8, 13, 21),
                  e=rep(c(0, 1), 4))
s1 <- with(df0, Surv(t, e, type="right"))
ten(s1)
## some awkward values
suppressWarnings(
    s1 <- Surv(time=c(Inf, -1, NaN, NA, 10, 12),
               event=c(c(NA, 1, 1, NaN, Inf, 0.75))))
ten(s1)

## coxph object
## K&M. Section 1.2. Table 1.1, page 2.
data("hodg", package="KMsurv")
hodg <- data.table::data.table(hodg)
data.table::setnames(hodg,
                     c(names(hodg)[!names(hodg) %in%
                                   c("score", "wtime")],
                       "Z1", "Z2"))
c1 <- coxph(Surv(time=time, event=delta) ~ Z1 + Z2,
            data=hodg[gtype==1 && dtype==1, ])
ten(c1)
data("bmt", package="KMsurv")
ten(c1 <- coxph(Surv(t2, d3) ~ z3*z10, data=bmt))
## T&G. Section 3.2, pg 47.
## stratified model
data("pbc", package="survival")
c1 <- coxph(Surv(time, status==2) ~ log(bili) + age + strata(edema), data=pbc)
ten(c1)

## K&M. Example 7.2, pg 210.
data("kidney", package="KMsurv")
with(kidney[kidney$type==2, ], ten(Surv(time=time, event=delta)))
s1 <- survfit(Surv(time=time, event=delta) ~ type, data=kidney)
ten(s1)[e > 0, ]

## A null model is passed to ten.Surv
(t1 <- with(kidney, ten(Surv(time=time, event=delta) ~ 0)))
## but the original call is preserved
attr(t1, "call")
## survival::survfit doesn't accept interaction terms...
## Not run: 
##D     s1 <- survfit(Surv(t2, d3) ~ z3*z10, data=bmt)
## End(Not run)
## but ten.formula does:
ten(Surv(time=t2, event=d3) ~ z3*z10, data=bmt)
## the same is true for the '.' (dot operator) in formulas
(t1 <- ten(Surv(time=t2, event=d3) ~ ., data=bmt))
## impractical long names stored as an attribute
attr(t1, "longNames")

## not typically intended to be called directly
mf1 <- stats::model.frame(Surv(time, status==2) ~ age + strata(edema) + strata(spiders), pbc, 
                          drop.unused.levels = TRUE)
ten(mf1)




