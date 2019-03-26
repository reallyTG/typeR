library(survMisc)


### Name: sf
### Title: *s*urvival (or hazard) *f*unction based on e and n.
### Aliases: sf sf.default sf.ten sf.stratTen strat.Ten sf.numeric
### Keywords: survival

### ** Examples

data("kidney", package="KMsurv")
k1 <- ten(Surv(time=time, event=delta) ~ type, data=kidney)
sf(k1)
sf(k1, times=1:10, reCalc=TRUE)
k2 <- ten(with(kidney, Surv(time=time, event=delta)))
sf(k2)
## K&M. Table 4.1A, pg 93.
## 6MP patients
data("drug6mp", package="KMsurv")
d1 <- with(drug6mp, Surv(time=t2, event=relapse))
(d1 <- ten(d1))
sf(x=d1$e, n=d1$n, what="S")

data("pbc", package="survival")
t1 <- ten(Surv(time, status==2) ~ log(bili) + age + strata(edema), data=pbc)
sf(t1)

## K&M. Table 4.2, pg 94.
data("bmt", package="KMsurv")
b1 <- bmt[bmt$group==1, ] # ALL patients
t2 <- ten(Surv(time=b1$t2, event=b1$d3))
with(t2, sf(x=e, n=n, what="Hv"))
## K&M. Table 4.3, pg 97.
sf(x=t2$e, n=t2$n, what="all")




