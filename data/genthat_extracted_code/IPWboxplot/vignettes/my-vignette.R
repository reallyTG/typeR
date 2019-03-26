## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(IPWboxplot)

## ---- par=TRUE,message=FALSE---------------------------------------------
library(mice)
data(boys)
attach(boys)
dim(boys)
res=IPW.quantile(tv,x=age,probs=c(0.25,0.5,0.75,0.9))
ls(res)
#res$px is the vector of estimated drop-out probabilities
#res$IPW.quantile is the vector of estimated IPW quantiles
res$IPW.quantile

## ---- par=TRUE, fig.cap="Inverse probability weighted boxplot for testicular volume"----
res=IPW.boxplot(tv,x=age,main=" ")


## ------------------------------------------------------------------------
ls(res)

## ---- par=TRUE-----------------------------------------------------------
res$out.IPW

## ---- par=TRUE,fig.cap="Inverse probability weighted and naive boxplots for testicular volume"----
res1=IPW.boxplot(tv,x=age,graph="both",color="blue",size.letter=0.7,main=" ")


## ------------------------------------------------------------------------
ls(res1)

## ---- fig.cap="Inverse probability weighted  boxplot adapted to skewness for head circumference.",fig.show='hold'----
res2=IPW.ASYM.boxplot(hc,x=age,size.letter=0.85,main=" ")

## ------------------------------------------------------------------------
ls(res2)

## ---- par=TRUE-----------------------------------------------------------
res2$out.IPW

## ------------------------------------------------------------------------
res2$SKEW.IPW

## ---- par=TRUE,fig.cap="Inverse probability weighted and naive boxplots adjusted for skewness of head circumference.",fig.show='hold'----
res3=IPW.ASYM.boxplot(hc,x=age,graph="both",main=" ",color="blue",size.letter=0.75)

## ------------------------------------------------------------------------
res3$out.IPW
res3$out.NAIVE

## ------------------------------------------------------------------------
res3$SKEW.IPW
res3$SKEW.NAIVE

