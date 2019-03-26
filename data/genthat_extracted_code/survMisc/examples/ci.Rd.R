library(survMisc)


### Name: ci
### Title: *c*onfidence *i*ntervals for survival curves.
### Aliases: ci ci.ten ci.stratTen
### Keywords: survival

### ** Examples

## K&M 2nd ed. Section 4.3. Example 4.2, pg 105.
data("bmt", package="KMsurv")
b1 <- bmt[bmt$group==1, ] # ALL patients
## K&M 2nd ed. Section 4.4. Example 4.2 (cont.), pg 111.
## patients with ALL
t1 <- ten(Surv(t2, d3) ~ 1, data=bmt[bmt$group==1, ])
ci(t1, how="nair", trans="lin", tL=100, tU=600)
## Table 4.5, pg. 111.
lapply(list("lin", "log", "asi"),
       function(x) ci(t1, how="nair", trans=x, tL=100, tU=600))
## Table 4.6, pg. 111.
lapply(list("lin", "log", "asi"),
       function(x) ci(t1, how="hall", trans=x, tL=100, tU=600))
t1 <- ten(Surv(t2, d3) ~ group, data=bmt)
ci(t1, CI="0.95", how="nair", trans="lin", tL=100, tU=600)

## stratified model
data("pbc", package="survival")
t1 <- ten(coxph(Surv(time, status==2) ~ log(bili) + age + strata(edema), data=pbc))
ci(t1)




