library(survMisc)


### Name: cutp
### Title: *cut p*oint for a continuous variable in a model fit with
###   'coxph' or 'survfit'.
### Aliases: cutp cutp.coxph cutp.survfit

### ** Examples

## Mandrekar et al. above
data("bmt", package="KMsurv")
b1 <- bmt[bmt$group==1, ] # ALL patients
c1 <- coxph(Surv(t2, d3) ~ z1, data=b1) # z1=age
c1 <- cutp(c1)$z1
data.table::setorder(c1, "z1")
## [] below is used to print data.table to console
c1[]

## Not run: 
##D ## compare to output from survival::coxph
##D matrix(
##D     unlist(
##D         lapply(26:30,
##D                function(i) c(i, summary(coxph(Surv(t2, d3) ~ z1 >= i, data=b1))$sctest))),
##D     ncol=5,
##D     dimnames=list(c("age", "score_test", "df", "p")))
##D cutp(coxph(Surv(t2, d3) ~ z1, data=bmt[bmt$group==2, ]))$z1[]
##D cutp(coxph(Surv(t2, d3) ~ z1, data=bmt[bmt$group==3, ]))[[1]][]
##D ## K&M. Example 8.3, pg 273-274.
##D data("kidtran", package="KMsurv")
##D k1 <- kidtran
##D ## patients who are male and black
##D k2 <- k1[k1$gender==1 & k1$race==2, ]
##D c2 <- coxph(Surv(time, delta) ~ age, data=k2)
##D print(cutp(c2))
##D ## check significance of computed value
##D summary(coxph(Surv(time, delta) ~ age >= 58, data=k2))
##D k3 <- k1[k1$gender==2 & k1$race==2, ]
##D c3 <- coxph(Surv(time, delta) ~ age, data=k3)
##D print(cutp(c3))
##D ## doesn't apply to binary variables e.g. gender
##D print(cutp(coxph(Surv(time, delta) ~ age + gender, data=k1)))
## End(Not run)




