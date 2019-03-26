## ----comment=NA----------------------------------------------------------
require(moonBook)   # for use of data radial
fit=lm(NTAV~age,data=radial)
summary(fit)

## ----comment=NA,message=FALSE,fig.width=5,fig.height=5-------------------
require(ggplot2)
ggplot(radial,aes(y=NTAV,x=age))+geom_point()+geom_smooth(method="lm")

## ----comment=NA,message=FALSE--------------------------------------------
require(ggiraph)
require(ggiraphExtra)
require(plyr)
ggPredict(fit,se=TRUE,interactive=TRUE)

## ----comment=NA----------------------------------------------------------
fit1=lm(NTAV~age+sex,data=radial)
summary(fit1)

## ----comment=NA,message=FALSE,fig.width=5,fig.height=5-------------------

equation1=function(x){coef(fit1)[2]*x+coef(fit1)[1]}
equation2=function(x){coef(fit1)[2]*x+coef(fit1)[1]+coef(fit1)[3]}

ggplot(radial,aes(y=NTAV,x=age,color=sex))+geom_point()+
        stat_function(fun=equation1,geom="line",color=scales::hue_pal()(2)[1])+
        stat_function(fun=equation2,geom="line",color=scales::hue_pal()(2)[2])


## ------------------------------------------------------------------------
ggPredict(fit1,se=TRUE,interactive=TRUE)

## ----comment=NA----------------------------------------------------------
fit2=lm(NTAV~age*DM,data=radial)
summary(fit2)

## ----comment=NA,message=FALSE,fig.width=5,fig.height=5-------------------
ggplot(radial,aes(y=NTAV,x=age,color=factor(DM)))+geom_point()+stat_smooth(method="lm",se=FALSE)

## ------------------------------------------------------------------------
ggPredict(fit2,colorAsFactor = TRUE,interactive=TRUE)

## ----comment=NA----------------------------------------------------------
fit3=lm(NTAV~age*weight,data=radial)
summary(fit3)

## ----comment=NA,message=FALSE,fig.width=5,fig.height=5-------------------
ggplot(radial,aes(y=NTAV,x=age,color=weight))+geom_point()+stat_smooth(method="lm",se=FALSE)

## ------------------------------------------------------------------------
ggPredict(fit3,interactive=TRUE)

## ----comment=NA,message=FALSE,fig.width=5,fig.height=5-------------------
fit4=lm(NTAV~age*weight*HBP,data=radial)
summary(fit4)

## ------------------------------------------------------------------------
ggPredict(fit4,interactive = TRUE)

## ----comment=NA,message=FALSE--------------------------------------------
require(TH.data) # for use data GBSG2
fit5=glm(cens~pnodes*horTh,data=GBSG2,family=binomial)
summary(fit5)

## ------------------------------------------------------------------------
ggPredict(fit5,se=TRUE,interactive=TRUE,digits=3)

## ----comment=NA,message=FALSE--------------------------------------------
fit6=glm(cens~pnodes+horTh,data=GBSG2,family=binomial)
summary(fit6)

## ------------------------------------------------------------------------
ggPredict(fit6,se=TRUE,interactive=TRUE,digits=3)

## ----comment=NA,message=FALSE--------------------------------------------
fit7=glm(cens~pnodes*age,data=GBSG2,family=binomial)
summary(fit7)

## ----warning=FALSE-------------------------------------------------------
ggPredict(fit7,interactive=TRUE)

## ----warning=FALSE-------------------------------------------------------
ggPredict(fit7,interactive=TRUE,colorn=100,jitter=FALSE)

## ----comment=NA,message=FALSE--------------------------------------------
fit8=glm(cens~pnodes*age*horTh,data=GBSG2,family=binomial)
summary(fit8)

## ----warning=FALSE-------------------------------------------------------
ggPredict(fit8,interactive=TRUE,colorn=100,jitter=FALSE)

