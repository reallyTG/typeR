library(prodlim)


### Name: model.design
### Title: Extract a design matrix and specials from a model.frame
### Aliases: model.design

### ** Examples

# specials that are evaluated. here ID needs to be defined 
set.seed(8)
d <- data.frame(y=rnorm(5),x=factor(c("a","b","b","a","c")),z=c(2,2,7,7,7),v=sample(letters)[1:5])
d$z <- factor(d$z,levels=c(1:8))
ID <- function(x)x
f <- formula(y~x+ID(z))
t <- terms(f,special="ID",data=d)
mda <- model.design(terms(t),data=d,specialsFactor=TRUE)
mda$ID
mda$design
## 
mdb <- model.design(terms(t),data=d,specialsFactor=TRUE,unspecialsDesign=FALSE)
mdb$ID
mdb$design

# set x-levels
attr(mdb$ID,"levels")
attr(model.design(terms(t),data=d,xlev=list("ID(z)"=1:10),
     specialsFactor=TRUE)$ID,"levels")

# special specials (avoid define function SP)
f <- formula(y~x+SP(z)+factor(v))
t <- terms(f,specials="SP",data=d)
st <- strip.terms(t,specials="SP",arguments=NULL)
md2a <- model.design(st,data=d,specialsFactor=TRUE,specialsDesign="SP")
md2a$SP
md2b <- model.design(st,data=d,specialsFactor=TRUE,specialsDesign=FALSE)
md2b$SP

# special function with argument
f2 <- formula(y~x+treat(z,power=2)+treat(v,power=-1))
t2 <- terms(f2,special="treat")
st2 <- strip.terms(t2,specials="treat",arguments=list("treat"=list("power")))
model.design(st2,data=d,specialsFactor=FALSE)
model.design(st2,data=d,specialsFactor=TRUE)
model.design(st2,data=d,specialsDesign=TRUE)

library(survival)
data(pbc)
t3 <- terms(Surv(time,status!=0)~factor(edema)*age+strata(I(log(bili)>1))+strata(sex),
            specials=c("strata","cluster"))
st3 <- strip.terms(t3,specials=c("strata"),arguments=NULL)
md3 <- model.design(terms=st3,data=pbc[1:4,])
md3$strata
md3$cluster

f4 <- Surv(time,status)~age+const(factor(edema))+strata(sex,test=0)+prop(bili,power=1)+tp(albumin)
t4 <- terms(f4,specials=c("prop","timevar","strata","tp","const"))
st4 <- strip.terms(t4,
                   specials=c("prop","timevar"),
                   unspecials="prop",
                   alias.names=list("timevar"="strata","prop"=c("const","tp")),
                   arguments=list("prop"=list("power"=0),"timevar"=list("test"=0)))
formula(st4)
md4 <- model.design(st4,data=pbc[1:4,],specialsDesign=TRUE)
md4$prop
md4$timevar




