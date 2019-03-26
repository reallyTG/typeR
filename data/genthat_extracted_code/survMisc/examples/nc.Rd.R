library(survMisc)


### Name: nc
### Title: Add *n*umber *c*ensored.
### Aliases: nc nc.ten nc.stratTen

### ** Examples

data("kidney", package="KMsurv")
t1 <- ten(survfit(Surv(time, delta) ~ type, data=kidney))
nc(t1)
nc(asWide(t1))

## stratified model
data("pbc", package="survival")
t1 <- ten(coxph(Surv(time, status==2) ~ log(bili) + age + strata(edema), data=pbc))
nc(t1)




