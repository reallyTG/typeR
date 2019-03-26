## ----JRG_data, echo=TRUE-------------------------------------------------
library(tsvr)
class(JRGdat)
names(JRGdat)
d<-t(as.matrix(JRGdat[,2:dim(JRGdat)[2]]))
dim(d)

## ----vreq_classic_demo, echo=TRUE----------------------------------------
res<-vreq_classic(d)
class(res)
names(res)
summary(res)
print(res)
all.equal(res$com,res$comnull*res$vr)

## ----vreq_LdM_demo, echo=TRUE--------------------------------------------
res<-vreq_LdM(d)
class(res)
names(res)
summary(res)
print(res)
all.equal(res$com,res$comnull*res$vr)
all.equal(res$com,vreq_classic(d)$com)

## ----tsvreq_classic_demo, echo=TRUE--------------------------------------
res<-tsvreq_classic(d)
class(res)
names(res)
summary(res)
print(res)
all.equal(res$com,res$tsvr*res$comnull)
all.equal(sum(res$com),vreq_classic(d)$com)
all.equal(sum(res$comnull),vreq_classic(d)$comnull)

## ----tsvreq_classic_demo_2, echo=TRUE------------------------------------
sum(res$wts)
res2<-vreq_classic(d)
all.equal(sum(res$tsvr),res2$vr)
all.equal(sum(res$wts*res$tsvr),res2$vr)

## ----tsvreq_classic_demo_3, echo=TRUE, out.height="50%"------------------
plot(res,filename="Tsvreq_classic_demo")
knitr::include_graphics("Tsvreq_classic_demo.pdf")

## ----agg_demo, echo=TRUE-------------------------------------------------
res<-tsvreq_classic(d)
aggresLong<-aggts(res,res$ts[res$ts>=4])
aggresShort<-aggts(res,res$ts[res$ts<4])
class(aggresLong)
names(aggresLong)
print(aggresLong)
print(aggresShort)

