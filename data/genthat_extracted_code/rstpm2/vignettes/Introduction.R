### R code from vignette source 'Introduction.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Introduction.Rnw:85-89
###################################################

options(width=80,useFancyQuotes="UTF-8")
library(rstpm2)



###################################################
### code chunk number 2: Introduction.Rnw:234-242
###################################################
brcancer <- transform(brcancer, recyear=rectime / 365.24)
fit <- stpm2(Surv(recyear,censrec==1)~hormon, data=brcancer, df=4)
summary(fit)
## utility 
eform.coxph <- function(object) exp(cbind(coef(object),confint(object)))
fit.cox <- coxph(Surv(recyear,censrec==1)~hormon, data=brcancer)
rbind(cox=eform(fit.cox),
      eform(fit)[2,,drop=FALSE])


###################################################
### code chunk number 3: Introduction.Rnw:250-255
###################################################
plot(fit, newdata=data.frame(hormon=0), xlab="Time since diagnosis (years)")
lines(fit, newdata=data.frame(hormon=1), lty=2)
lines(survfit(Surv(recyear,censrec==1)~hormon, data=brcancer), col="blue", lty=1:2)
legend("topright", c("PH hormon=0","PH hormon=1","KM hormon=0","KM hormon=1"), 
       lty=1:2, col=c("black","black","blue","blue"))


###################################################
### code chunk number 4: Introduction.Rnw:258-262
###################################################
plot(fit,newdata=data.frame(hormon=1), type="hazard",
     xlab="Time since diagnosis (years)", ylim=c(0,0.3))
lines(fit, newdata=data.frame(hormon=0), col=2, lty=2, type="hazard")
legend("topright", c("hormon=1","hormon=0"),lty=1:2,col=1:2,bty="n")


###################################################
### code chunk number 5: Introduction.Rnw:269-273
###################################################
plot(fit,newdata=data.frame(hormon=0), type="hdiff",
     exposed=function(data) transform(data, hormon=1),
     main="hormon=1 compared with hormon=0",
     xlab="Time since diagnosis (years)")


###################################################
### code chunk number 6: Introduction.Rnw:275-279
###################################################
plot(fit,newdata=data.frame(hormon=0), type="sdiff",
     exposed=function(data) transform(data, hormon=1),
     main="hormon=1 compared with hormon=0",
     xlab="Time since diagnosis (years)")


###################################################
### code chunk number 7: Introduction.Rnw:290-299
###################################################
brcancer <- transform(brcancer, recyear=rectime / 365.24)
fit <- stpm2(Surv(recyear,censrec==1)~hormon, data=brcancer, link.type="AH")
summary(fit)
confint(fit)
plot(fit, newdata=data.frame(hormon=0), xlab="Time on study (years)")
lines(fit, newdata=data.frame(hormon=1), lty=2)
lines(survfit(Surv(recyear,censrec==1)~hormon, data=brcancer), col="blue", lty=1:2)
legend("topright", c("AH hormon=0","AH hormon=1","KM hormon=0","KM hormon=1"), 
       lty=1:2, col=c("black","black","blue","blue"))


###################################################
### code chunk number 8: Introduction.Rnw:303-311
###################################################
fit <- stpm2(Surv(recyear,censrec==1)~1, data=brcancer, link.type="AH",
             smooth.formula=~ns(sqrt(recyear),df=3)+hormon:ns(recyear,df=3))
summary(fit)
plot(fit, newdata=data.frame(hormon=0), xlab="Time on study (years)")
suppressWarnings(lines(fit, newdata=data.frame(hormon=1), lty=2))
lines(survfit(Surv(recyear,censrec==1)~hormon, data=brcancer), col="blue", lty=1:2)
legend("topright", c("AH hormon=0","AH hormon=1","KM hormon=0","KM hormon=1"), 
       lty=1:2, col=c("black","black","blue","blue"))


###################################################
### code chunk number 9: Introduction.Rnw:334-338
###################################################

options(width=80,useFancyQuotes="UTF-8")
library(rstpm2)



###################################################
### code chunk number 10: Introduction.Rnw:340-353
###################################################

popmort2 <- transform(rstpm2::popmort,exitage=age,exityear=year,age=NULL,year=NULL)
colon2 <- within(rstpm2::colon, {
  status <- ifelse(surv_mm>120.5,1,status)
  tm <- pmin(surv_mm,120.5)/12
  exit <- dx+tm*365.25
  sex <- as.numeric(sex)
  exitage <- pmin(floor(age+tm),99)
  exityear <- floor(yydx+tm)
  ##year8594 <- (year8594=="Diagnosed 85-94")
})
colon2 <- merge(colon2,popmort2)



###################################################
### code chunk number 11: Introduction.Rnw:357-362
###################################################

fit0 <- stpm2(Surv(tm,status %in% 2:3)~I(year8594=="Diagnosed 85-94"),
              data=colon2,
              bhazard=colon2$rate, df=5)



###################################################
### code chunk number 12: Introduction.Rnw:364-371
###################################################

summary(fit <- stpm2(Surv(tm,status %in% 2:3)~I(year8594=="Diagnosed 85-94"),
                     data=colon2,
                     bhazard=colon2$rate,
                     df=5,cure=TRUE))
predict(fit,head(colon2),se.fit=TRUE)



###################################################
### code chunk number 13: Introduction.Rnw:389-396
###################################################

newdata.eof <- data.frame(year8594 = unique(colon2$year8594),
                          tm=10)
predict(fit0, newdata.eof, type="fail", se.fit=TRUE)
predict(fit, newdata.eof, type="fail", se.fit=TRUE)
predict(fit, newdata.eof, type="haz", se.fit=TRUE)



###################################################
### code chunk number 14: Introduction.Rnw:400-415
###################################################

tms=seq(0,10,length=301)[-1]
plot(fit0,newdata=data.frame(year8594 = "Diagnosed 85-94", tm=tms), ylim=0:1,
     xlab="Time since diagnosis (years)", ylab="Relative survival")
plot(fit0,newdata=data.frame(year8594 = "Diagnosed 75-84",tm=tms),
     add=TRUE,line.col="red",rug=FALSE)
## warnings: Predicted hazards less than zero for cure
plot(fit,newdata=data.frame(year8594 = "Diagnosed 85-94",tm=tms),
     add=TRUE,ci=FALSE,lty=2,rug=FALSE)
plot(fit,newdata=data.frame(year8594="Diagnosed 75-84",tm=tms),
     add=TRUE,rug=FALSE,line.col="red",ci=FALSE,lty=2)
legend("topright",c("85-94 without cure","75-84 without cure",
                    "85-94 with cure","75-84 with cure"),
       col=c(1,2,1,2), lty=c(1,1,2,2), bty="n")



###################################################
### code chunk number 15: Introduction.Rnw:422-439
###################################################

plot(fit0,newdata=data.frame(year8594 = "Diagnosed 85-94", tm=tms), 
     ylim=c(0,0.5), type="hazard",
     xlab="Time since diagnosis (years)",ylab="Excess hazard")
plot(fit0,newdata=data.frame(year8594 = "Diagnosed 75-84", tm=tms),
     type="hazard",
     add=TRUE,line.col="red",rug=FALSE)
plot(fit,newdata=data.frame(year8594 = "Diagnosed 85-94", tm=tms),
     type="hazard",
     add=TRUE,ci=FALSE,lty=2,rug=FALSE)
plot(fit,newdata=data.frame(year8594="Diagnosed 75-84", tm=tms),
     type="hazard",
     add=TRUE,rug=FALSE,line.col="red",ci=FALSE,lty=2)
legend("topright",c("85-94 without cure","75-84 without cure",
                    "85-94 with cure","75-84 with cure"),
       col=c(1,2,1,2), lty=c(1,1,2,2), bty="n")



###################################################
### code chunk number 16: Introduction.Rnw:445-458
###################################################

newdata.eof <- data.frame(year8594 = unique(colon2$year8594),
                          tm=10)
test <- predictnl(fit, function(object,newdata=NULL) {
    lp1 <- predict(object, newdata.eof[1,], type="link")
    lp2 <- predict(object, newdata.eof[2,], type="link")
    lp1-lp2
})
with(test, c(fit=fit,
             se.fit=se.fit,
             statistic=fit/se.fit,
             p=2*pnorm(abs(fit/se.fit), lower.tail=FALSE)))



