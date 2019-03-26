library(survMisc)


### Name: comp
### Title: compare survival curves
### Aliases: comp comp.ten

### ** Examples

## Two covariate groups
data("leukemia", package="survival")
f1 <- survfit(Surv(time, status) ~ x, data=leukemia)
comp(ten(f1))
## K&M 2nd ed. Example 7.2, Table 7.2, pp 209--210.
data("kidney", package="KMsurv")
t1 <- ten(Surv(time=time, event=delta) ~ type, data=kidney)
comp(t1, p=c(0, 1, 1, 0.5, 0.5), q=c(1, 0, 1, 0.5, 2))
## see the weights used
attributes(t1)$lrw
## supremum (Renyi) test; two-sided; two covariate groups
## K&M 2nd ed. Example 7.9, pp 223--226.
data("gastric", package="survMisc")
g1 <- ten(Surv(time, event) ~ group, data=gastric)
comp(g1)
## Three covariate groups
## K&M 2nd ed. Example 7.4, pp 212-214.
data("bmt", package="KMsurv")
b1 <- ten(Surv(time=t2, event=d3) ~ group, data=bmt)
comp(b1, p=c(1, 0, 1), q=c(0, 1, 1))
## Tests for trend
## K&M 2nd ed. Example 7.6, pp 217-218.
data("larynx", package="KMsurv")
l1 <- ten(Surv(time, delta) ~ stage, data=larynx)
comp(l1)
attr(l1, "tft")
### see effect of F-H test
data("alloauto", package="KMsurv")
a1 <- ten(Surv(time, delta) ~ type, data=alloauto)
comp(a1, p=c(0, 1), q=c(1, 1))




