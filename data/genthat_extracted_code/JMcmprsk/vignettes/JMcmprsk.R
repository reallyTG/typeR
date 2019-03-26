## ---- message=FALSE, warning=FALSE, results='asis'-----------------------
set.seed(123)
require(JMcmprsk)
yfile=system.file("extdata", "fvc621_y.txt", package = "JMcmprsk")
cfile=system.file("extdata", "fvc621_c.txt", package = "JMcmprsk")
mfile=system.file("extdata", "fvc621_m.txt", package = "JMcmprsk")

## ---- eval=FALSE, message=FALSE, warning=FALSE---------------------------
#  jmcfit = jmc(p=8,yfile,cfile,mfile,point=20,do.trace = F)
#  

## ---- echo=TRUE, message=FALSE, warning=FALSE, results='base'------------
#because of the long running time, we save the jmo and jmc results within the package
fitfile=system.file("extdata", "runfit.RData", package = "JMcmprsk")
load(fitfile)
jmcfit

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
coef(jmcfit)

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
anova(jmcfit,coeff="beta")
anova(jmcfit,coeff="gamma")

## ---- message=FALSE, warning=FALSE, results='asis'-----------------------
set.seed(123)
require(JMcmprsk)
yfile=system.file("extdata", "ninds_nrank_y.txt", package = "JMcmprsk")
cfile=system.file("extdata", "ninds_nrank_c.txt", package = "JMcmprsk")
mfile=system.file("extdata", "ninds_nrank_m.txt", package = "JMcmprsk")

## ---- eval=FALSE, message=FALSE, warning=FALSE, results='asis'-----------
#  jmofit = jmo(p=9,s=2, yfile,cfile,mfile,point=20,do.trace = F)

## ---- echo=TRUE, message=FALSE, warning=FALSE, results='base'------------
#because of the long running time, we save the jmo and jmc results within the package
fitfile=system.file("extdata", "runfit.RData", package = "JMcmprsk")
load(fitfile)
jmofit

