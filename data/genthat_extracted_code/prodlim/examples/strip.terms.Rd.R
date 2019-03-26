library(prodlim)


### Name: strip.terms
### Title: Strip special functions from terms
### Aliases: strip.terms

### ** Examples


## parse a survival formula and identify terms which
## should be treated as proportional or timevarying:
f <- Surv(time,status)~age+prop(factor(edema))+timevar(sex,test=0)+prop(bili,power=1)
tt <- terms(f,specials=c("prop","timevar"))
attr(tt,"specials")
st <- strip.terms(tt,specials=c("prop","timevar"),arguments=NULL)
formula(st)
attr(st,"specials")
attr(st,"stripped.specials")

## provide a default value for argument power of proportional treatment
## and argument test of timevarying treatment: 
st2 <- strip.terms(tt,
                   specials=c("prop","timevar"),
                   arguments=list("prop"=list("power"=0),"timevar"=list("test"=0)))
formula(st2)
attr(st2,"stripped.specials")
attr(st2,"stripped.arguments")

## treat all unspecial terms as proportional
st3 <- strip.terms(tt,
                   unspecials="prop",
                   specials=c("prop","timevar"),
                   arguments=list("prop"=list("power"=0),"timevar"=list("test"=0)))
formula(st3)
attr(st3,"stripped.specials")
attr(st3,"stripped.arguments")

## allow alias names: strata for timevar and tp, const for prop.
## IMPORTANT: the unstripped terms need to know about
## all specials including the aliases
f <- Surv(time,status)~age+const(factor(edema))+strata(sex,test=0)+prop(bili,power=1)+tp(albumin)
tt2 <- terms(f,specials=c("prop","timevar","strata","tp","const"))
st4 <- strip.terms(tt2,
                   specials=c("prop","timevar"),
                   unspecials="prop",
                   alias.names=list("timevar"="strata","prop"=c("const","tp")),
                   arguments=list("prop"=list("power"=0),"timevar"=list("test"=0)))
formula(st4)
attr(st4,"stripped.specials")
attr(st4,"stripped.arguments")

## test if alias works also without unspecial argument
st5 <- strip.terms(tt2,
                   specials=c("prop","timevar"),
                   alias.names=list("timevar"="strata","prop"=c("const","tp")),
                   arguments=list("prop"=list("power"=0),"timevar"=list("test"=0)))
formula(st5)
attr(st5,"stripped.specials")
attr(st5,"stripped.arguments")

library(survival)
data(pbc)
model.design(st4,data=pbc[1:3,],specialsDesign=TRUE)
model.design(st5,data=pbc[1:3,],specialsDesign=TRUE)





