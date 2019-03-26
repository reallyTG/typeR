library(pec)


### Name: reclass
### Title: Retrospective risk reclassification table
### Aliases: reclass

### ** Examples

## Not run: 
##D library(survival)
##D set.seed(40)
##D d <- prodlim::SimSurv(400)
##D nd <- prodlim::SimSurv(400)
##D Models <- list("Cox.X2"=coxph(Surv(time,status)~X2,data=d,x=TRUE,y=TRUE),
##D                "Cox.X1.X2"=coxph(Surv(time,status)~X1+X2,data=d,x=TRUE,y=TRUE))
##D rc <- reclass(Models,formula=Surv(time,status)~1,data=nd,time=5)
##D print(rc)
##D plot(rc)
##D 
##D set.seed(40)
##D library(riskRegression)
##D library(prodlim)
##D dcr <- prodlim::SimCompRisk(400)
##D ndcr <- prodlim::SimCompRisk(400)
##D crPred5 <- list("X2"=predictEventProb(CSC(Hist(time,event)~X2,data=dcr),newdata=ndcr,times=5),
##D                 "X1+X2"=predictEventProb(CSC(Hist(time,event)~X1+X2,data=dcr),newdata=ndcr,times=5))
##D rc <- reclass(crPred5,Hist(time,event)~1,data=ndcr,time=3)
##D print(rc)
##D 
##D reclass(crPred5,Hist(time,event)~1,data=ndcr,time=5,cuts=100*c(0,0.05,0.1,0.2,1))
## End(Not run)



