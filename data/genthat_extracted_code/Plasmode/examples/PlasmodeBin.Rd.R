library(Plasmode)


### Name: PlasmodeBin
### Title: Performs the plasmode simulation
### Aliases: PlasmodeBin

### ** Examples

{
library(mgcv)
library(nlme)
library(glm2)
library(arm)
library(MASS)
library(lme4)
library(epiDisplay)
library(foreign)
library(nnet)

data("Compaq")
levels(Compaq$stage) <- c(1,2,3,4)
Compaq$stage<-as.numeric(levels(Compaq$stage))[Compaq$stage]
## Creating the binary exposure variable
Compaq$exposure<-ifelse(Compaq$hospital == "Public hospital",1,0)
## Creating binary variables for some confounders
Compaq$ses1<-ifelse(Compaq$ses == "Poor",1,0)
Compaq$ses2<-ifelse(Compaq$ses == "Poor-middle",1,0)
Compaq$ses3<-ifelse(Compaq$ses == "High-middle",1,0)

Compaq$age1<-ifelse(Compaq$agegr == "<40",1,0)
Compaq$age2<-ifelse(Compaq$agegr == "40-49",1,0)
Compaq$age3<-ifelse(Compaq$agegr == "50-59",1,0)


## Creating the formulas for the outcome and the exposure model
form1<- status~ exposure + stage + ses1 + ses2 + ses3 + age1 + age2 + age3
form2<- exposure ~ stage + ses1 + ses2 + ses3 + age1 + age2 + age3

set.seed(111)
Bin_Form1<-PlasmodeBin(formulaOut=form1, objectOut=NULL,formulaExp=form2,
                     objectExp= NULL,data=Compaq,idVar="id",effectOR =1,
                     MMOut=c(1,1,2,1,1,2,1,2),MMExp=c(1,1,1,1,1,1,1),
                     nsim=2, size=nrow(Compaq), eventRate=NULL, exposedPrev=NULL)

Bin_Form2<-PlasmodeBin(formulaOut=form1, objectOut=NULL,formulaExp=NULL,
                      objectExp= NULL,data=Compaq,idVar="id",effectOR =1,
                      MMOut=c(1,1,2,1,1,2,1,2),MMExp=1, nsim=2,
                      size=nrow(Compaq), eventRate=NULL, exposedPrev=NULL)

Bin_Form3<-PlasmodeBin(formulaOut=NULL, objectOut=NULL,formulaExp=form2,
                      objectExp= NULL,data=Compaq,idVar="id",effectOR =1,
                      MMOut=1,MMExp=c(1,1,1,1,1,1,1), nsim=2,
                      size=nrow(Compaq), eventRate=NULL, exposedPrev=NULL)


###################################################################################################
## One can provide the fitted model for the outcome model and the exposure model estimated by
## glm, gam, and bayesglm. The functional form of the fitted model for the outcome variable should
## of the form Outcome ~ Exposure + Confounders. The functional form of the exposure model is,
## Exposure ~ Confounders.
####################################################################################################

Coeff1<- bayesglm(form1, family = "binomial", data=Compaq,control=glm.control(trace=TRUE))
Coeff2<- bayesglm(form2, family = "binomial", data=Compaq,control=glm.control(trace=TRUE))
sizesim<-nrow(model.matrix(Coeff1))
sizesim1<-nrow(model.matrix(Coeff2))

Bin_Obj1<-PlasmodeBin(formulaOut=NULL, objectOut=Coeff1,formulaExp=NULL,
                     objectExp = Coeff2, idVar=Compaq$id,effectOR =1,
                     MMOut=c(1.5,1,2,1,1,1,1,1),MMExp=c(1,1,1,1,1,1,1),
                     nsim=2, size=sizesim, eventRate=NULL, exposedPrev=NULL)

Bin_Obj2<-PlasmodeBin(formulaOut=NULL, objectOut=Coeff1,formulaExp=NULL,
                     objectExp = NULL,idVar=Compaq$id,effectOR =1,
                     MMOut=c(1.5,1,2,1,1,1,1,1),MMExp=1,
                     nsim=2, size=sizesim, eventRate=NULL, exposedPrev=NULL)

Bin_Obj3<-PlasmodeBin(formulaOut=NULL, objectOut=NULL,formulaExp=NULL,
                     objectExp = Coeff2,idVar=Compaq$id,effectOR =1, MMOut=1,
                     MMExp=c(1,1,1,1,1,1,1),
                     nsim=2, size=sizesim1, eventRate=NULL, exposedPrev=NULL)
}



