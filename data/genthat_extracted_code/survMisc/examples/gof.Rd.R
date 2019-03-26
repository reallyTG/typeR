library(survMisc)


### Name: gof
### Title: *g*oodness *o*f *f*it test for a 'coxph' object
### Aliases: gof gof.coxph

### ** Examples

data("pbc", package="survival")
pbc <- pbc[!is.na(pbc$trt), ]
## make corrections as per Fleming
pbc[pbc$id==253, "age"] <-  54.4
pbc[pbc$id==107, "protime"] <-  10.7
### misspecified; should be log(bili) and log(protime) instead
c1 <- coxph(Surv(time, status==2) ~
            age + log(albumin) + bili + edema + protime,
            data=pbc)
gof(c1, G=10)
gof(c1)




