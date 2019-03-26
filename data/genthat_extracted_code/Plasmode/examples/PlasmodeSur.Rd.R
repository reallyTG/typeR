library(Plasmode)


### Name: PlasmodeSur
### Title: Performs the plasmode simulation
### Aliases: PlasmodeSur

### ** Examples

{
library(survival)
library(splines)
library(glm2)
## Creating data set for simulation
lung <- lung[complete.cases(lung),]
lung$id <- 1:nrow(lung)
lung$meal.cal <- ifelse(lung$meal.cal > 1000, 1, 0)
lung$status <- lung$status - 1

## Formulas for estimating the hazard of outcome event, the hazard of censoring and exposure.

form1<-Surv(lung$time, lung$status)~meal.cal+age+sex+ph.ecog+ph.karno
form2<-Surv(lung$time, !lung$status)~meal.cal+age+sex+ph.ecog+ph.karno
form3<- meal.cal~age+sex+ph.ecog+ph.karno

Sur_Form1<-PlasmodeSur(formulaOut=form1,formulaCen=form2, objectOut=NULL, objectCen = NULL,
            formulaExp=form3,objectExp=NULL,data=lung,idVar="id",effectOR =1, MMOut=c(0.5,2,2,1,3),
            MMExp=c(2,2,2,2), nsim=3, size=nrow(lung), eventRate=NULL, exposedPrev=NULL)

Sur_Form2<-PlasmodeSur(formulaOut=form1,formulaCen=form2, objectOut=NULL, objectCen = NULL,
            formulaExp=NULL,objectExp=NULL,data=lung,idVar="id",effectOR =1, MMOut=c(1,2,2,1,3),
            MMExp=c(1,1,1,1),nsim=3, size=nrow(lung), eventRate=NULL, exposedPrev=NULL)

Sur_Form3<-PlasmodeSur(formulaOut=NULL,formulaCen=NULL, objectOut=NULL, objectCen = NULL,
            formulaExp=form3,objectExp=NULL,data=lung,idVar="id",effectOR =1, MMOut=c(1,2,2,1,3),
            MMExp=c(1,1,1,1),nsim=3, size=nrow(lung), eventRate=NULL, exposedPrev=NULL)

## Objects for the hazard of the outcome event, hazard for censoring and the exposure.

smod1 <- coxph(Surv(lung$time, lung$status)~meal.cal+age+sex+ph.ecog+ph.karno, data = lung,x=TRUE)
smod2 <- coxph(Surv(lung$time, !lung$status)~meal.cal+age+sex+ph.ecog+ph.karno, data = lung,x=TRUE)
pmod1<-glm2(meal.cal~age+sex+ph.ecog+ph.karno, data = lung,family = "binomial",
            control=glm.control(trace=TRUE))

Sur_Obj1<-PlasmodeSur(formulaOut=NULL,formulaCen=NULL, objectOut=smod1,objectCen = smod2,
            formulaExp=NULL,objectExp=pmod1,idVar=lung$id, effectOR =1, MMOut=c(1,2,2,1,3),
            MMExp=1, nsim=3,size=nrow(lung), eventRate=0.5, exposedPrev=NULL)

Sur_Obj2<-PlasmodeSur(formulaOut=NULL,formulaCen=NULL, objectOut=smod1,objectCen = smod2,
            formulaExp=NULL,objectExp=NULL,idVar=lung$id, effectOR =1.5, MMOut=c(1,2,2,1,3),
            MMExp=1, nsim=3,size=nrow(lung), eventRate=0.5, exposedPrev=NULL)

Sur_Obj3<-PlasmodeSur(formulaOut=NULL,formulaCen=NULL, objectOut=NULL,objectCen = NULL,
            formulaExp=NULL,objectExp=pmod1,idVar=lung$id,effectOR =1, MMOut=c(1,2,2,1,3),
            MMExp=1, nsim=3,size=nrow(lung), eventRate=0.5, exposedPrev=NULL)
}



