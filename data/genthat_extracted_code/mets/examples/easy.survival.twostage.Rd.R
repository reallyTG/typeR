library(mets)


### Name: easy.survival.twostage
### Title: Wrapper for easy fitting of Clayton-Oakes or bivariate Plackett
###   models for bivariate survival data
### Aliases: easy.survival.twostage
### Keywords: survival twostage

### ** Examples

library(mets)
data("prt",package="mets")
prtsam <- blocksample(prt,idvar="id",1e3,replace=FALSE)
margp <- coxph(Surv(time,status==1)~factor(country),data=prtsam)
fitco <- survival.twostage(margp,data=prtsam,clusters=prtsam$id)
summary(fitco)

des <- model.matrix(~-1+factor(zyg),data=prtsam); 
fitco <- survival.twostage(margp,data=prtsam,theta.des=des,clusters=prtsam$id)
summary(fitco)
rm(prtsam)

dfam <- simSurvFam(1000)
dfam <- fast.reshape(dfam,var=c("x","time","status"))

desfs <- function(x,num1="num1",num2="num2")
{ 
pp <- (x[num1]=="m")*(x[num2]=="f")*1   ## mother-father 
pc <- (x[num1]=="m" | x[num1]=="f")*(x[num2]=="b1" | x[num2]=="b2")*1 ## mother-child
cc <- (x[num1]=="b1")*(x[num2]=="b1" | x[num2]=="b2")*1               ## child-child
c(pp,pc,cc)
} 

marg <- coxph(Surv(time,status)~factor(num),data=dfam)
out3 <- easy.survival.twostage(marg,data=dfam,time="time",status="status",id="id",
             deshelp=0,
             score.method="fisher.scoring",theta.formula=desfs,
             model="plackett",
             desnames=c("parent-parent","parent-child","child-cild"),iid=1)
summary(out3)




