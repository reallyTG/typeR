## ----setup, message=FALSE, echo=FALSE------------------------------------
library(knitr)
opts_knit$set(root.dir=normalizePath('../'))

## ---- message=FALSE------------------------------------------------------
library("structree")
data(CTB, package="structree")

## ------------------------------------------------------------------------
dim(CTB)
str(CTB)
nlevels(CTB$school)
table(CTB$school)

## ----tidy=TRUE,tidy.opts=list(width.cutoff=60)---------------------------
mod_CTB <- structree(score~tr(1|school)+gender, data=CTB, family=gaussian,
                     stop_criterion="pvalue", splits_max=34, alpha=0.05, trace=FALSE)

# print 
mod_CTB

## ------------------------------------------------------------------------
mod_CTB$opts

## ----fig.height=4,fig.width=4,fig.align='center'-------------------------
plot(mod_CTB, paths=TRUE)

## ----fig.height=4,fig.width=5,fig.align='center'-------------------------
plot(mod_CTB, result=TRUE, cex.txt=0.7, cex.main=1.2)

## ------------------------------------------------------------------------
coef(mod_CTB)

## ---- message=FALSE------------------------------------------------------
library("structree")
data(guPrenat, package="structree")

## ------------------------------------------------------------------------
dim(guPrenat)

## ------------------------------------------------------------------------
str(guPrenat)
nlevels(guPrenat$cluster)
table(guPrenat$cluster)

## ----tidy=TRUE,tidy.opts=list(width.cutoff=80)---------------------------
mod_gua <- structree(prenat~tr(1|cluster)+indig+momEd+husEd+husEmpl+TV+motherAge+toilet,data=guPrenat,family=binomial(link="logit"),stop_criterion="pvalue",splits_max=10,alpha=0.05,trace=FALSE)

# print 
mod_gua

## ------------------------------------------------------------------------
mod_gua$opts

## ----fig.height=4,fig.width=6,fig.align='center'-------------------------
plot(mod_gua, result=TRUE, cex.txt=0.7, cex.main=1.2)

## ------------------------------------------------------------------------
coef(mod_gua)

