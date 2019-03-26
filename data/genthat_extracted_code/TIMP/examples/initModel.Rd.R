library(TIMP)


### Name: initModel
### Title: Defines the model to be used in analysis.
### Aliases: initModel
### Keywords: file

### ** Examples


##############################
## READ IN PSI 1
##############################

data(denS4)

##############################
## PREPROCESS PSI 1
##############################

denS4<-preProcess(data = denS4, scalx2 = c(3.78, 643.5))

##############################
## READ IN PSI 2
##############################

data(denS5)

##############################
## PREPROCESS PSI 2
##############################

denS5<-preProcess(data = denS5, scalx2 = c(3.78, 643.5))

##############################
## DEFINE INITIAL MODEL
##############################

model1<- initModel(mod_type = "kin", 
kinpar= c(7.9, 1.08, 0.129, .0225, .00156) , 
irfpar=c( -.1018, 0.0434), 
disptau=FALSE, dispmu=TRUE, parmu = list(c(.230)), 
lambdac = 650,
seqmod=TRUE,
positivepar=c("kinpar"),
title="S4", 
cohspec = list( type = "irf"))

## Not run: 
##D 
##D ##############################
##D ## FIT INITIAL MODEL
##D ##############################
##D 
##D denRes1 <- fitModel(data=list(denS4, denS5), list(model1), 
##D opt=kinopt(iter=5, divdrel = TRUE, linrange = .2,
##D makeps = "den1", selectedtraces = c(1,5,10), plotkinspec =TRUE,
##D output="pdf", xlab = "time (ps)", ylab = "wavelength"))
##D 
##D ##############################
##D ## REFINE INITIAL MODEL, RE-FIT
##D ## adding some per-dataset parameters 
##D ##############################
##D 
##D denRes2 <- fitModel(data = list(denS4, denS5), modspec = list(model1),
##D modeldiffs = list(dscal = list(list(to=2,from=1,value=.457)), 
##D free = list(
##D list(what = "irfpar", ind = 1, dataset = 2, start=-.1932),
##D list(what = "kinpar", ind = 5, dataset = 2, start=.0004), 
##D list(what = "kinpar", ind = 4, dataset = 2, start= .0159)
##D )),
##D opt=kinopt(iter=5, divdrel = TRUE, linrange = .2,
##D xlab = "time (ps)", ylab = "wavelength", output="pdf",
##D makeps = "den2", selectedtraces = c(1,5,10)))
##D 
##D ##############################
##D ## REFINE MODEL FURTHER AS NEW MODEL OBJECT 
##D ##############################
##D 
##D model2 <- initModel(mod_type = "kin", 
##D kinpar= c(7.9, 1.08, 0.129, .0225, .00156), 
##D irfpar=c( -.1018, 0.0434), 
##D parmu = list(c(.230)), 
##D lambdac = 650,
##D positivepar=c("kinpar", "coh"), 
##D cohspec = list( type = "seq", start = c(8000, 1800)))
##D 
##D ##############################
##D ## FIT NEW MODEL OBJECT
##D ##############################
##D 
##D denRes3 <- fitModel(data = list(denS4, denS5), list(model2),
##D modeldiffs = list(dscal = list(list(to=2,from=1,value=.457)), 
##D free = list(
##D list(what = "irfpar", ind = 1, dataset = 2, start=-.1932),
##D list(what = "kinpar", ind = 5, dataset = 2, start=.0004), 
##D list(what = "kinpar", ind = 4, dataset = 2, start= .0159)
##D )),
##D opt=kinopt(iter=5, divdrel = TRUE, linrange = .2,
##D makeps = "den3", selectedtraces = c(1,5,10), plotkinspec =TRUE, 
##D stderrclp = TRUE, kinspecerr=TRUE, output="pdf",
##D xlab = "time (ps)", ylab = "wavelength", 
##D breakdown = list(plot=c(643.50, 658.62, 677.5))))
## End(Not run)



