library(Plasmode)


### Name: PlasmodeCont
### Title: Performs the plasmode simulation
### Aliases: PlasmodeCont

### ** Examples

{
## Example for using the PlasmodeCont
library(twang)
library(gbm)
library(lattice)
library(parallel)
library(survey)
library(grid)
library(Matrix)
library(xtable)
library(latticeExtra)
library(RColorBrewer)
library(arm)
set.seed(1)
data("lalonde")
## Creating the ID variable
lalonde$id <- 1:nrow(lalonde)

str(lalonde)
## Example for PlasmodeCont when the outcome and exposure models formulas are provided.
form1<- re78 ~ treat + age + educ + black + hisp+ nodegr  + married + re74 + re75
form2<- treat ~ age + educ + black + hisp + nodegr + married + re74 + re75
Cont_Form1<-PlasmodeCont(formulaOut=form1, objectOut = NULL,formulaExp=form2,objectExp = NULL,
                        data=lalonde,idVar="id",effectOR =0, MMOut=c(0,1,2,1,1,1,2,2,1),
                        MMExp=c(1,2,1,1,1,2,2,1),nsim=2, size=nrow(lalonde),
                        eventRate=NULL, exposedPrev=NULL)
Cont_Form2<-PlasmodeCont(formulaOut=form1, objectOut = NULL,formulaExp=NULL,objectExp = NULL,
                        data=lalonde,idVar="id",effectOR =0, MMOut=c(0,1,2,1,1,1,2,2,1),MMExp=1,
                        nsim=2, size=nrow(lalonde), eventRate=NULL, exposedPrev=NULL)
Cont_Form3<-PlasmodeCont(formulaOut=NULL, objectOut = NULL,formulaExp=form2,objectExp = NULL,
                        data=lalonde,idVar="id",effectOR =0, MMOut=1,MMExp=c(1,2,1,1,1,2,2,1),
                        nsim=2, size=nrow(lalonde), eventRate=NULL, exposedPrev=NULL)
## Example for PlasmodeCont when the fitted model objects are provided.
###################################################################################################
## One can provide the fitted model for the outcome model and the exposure model estimated by
## glm, gam, and bayesglm. The functional form of the fitted model for the outcome variable should
## of the form Outcome ~ Exposure + Confounders. The functional form of the exposure model is,
## Exposure ~ Confounders.
####################################################################################################
Coeff1c<- bayesglm(form1, family = "gaussian", data=lalonde,control=glm.control(trace=TRUE))
Coeff2c<- bayesglm(form2, family = "binomial", data=lalonde,control=glm.control(trace=TRUE))

sizesim<-nrow(model.matrix(Coeff1c))
sizesim1<-nrow(model.matrix(Coeff2c))

Cont_Obj1<-PlasmodeCont(formulaOut=NULL, objectOut = Coeff1c,formulaExp=NULL,objectExp = Coeff2c,
                       idVar=lalonde$id,effectOR =0, MMOut=c(0,1,2,1,1,1,2,2,1),
                       MMExp=c(1,2,1,1,1,2,2,1),
                       nsim=2, size=nrow(lalonde), eventRate=NULL, exposedPrev=NULL)

Cont_Obj2<-PlasmodeCont(formulaOut=NULL, objectOut = Coeff1c,formulaExp=NULL,objectExp = NULL,
                       idVar=lalonde$id,effectOR =1, MMOut=c(0,1,2,1,1,1,2,2,1),MMExp=1,
                       nsim=2, size=nrow(lalonde), eventRate=NULL, exposedPrev=NULL)

Cont_Obj3<-PlasmodeCont(formulaOut=NULL, objectOut = NULL,formulaExp=NULL,objectExp = Coeff2c,
                       idVar=lalonde$id,effectOR =1, MMOut=c(0,1,2,1,1,1,2,2,1),MMExp=1,
                       nsim=2, size=nrow(lalonde), eventRate=NULL, exposedPrev=NULL)
}



