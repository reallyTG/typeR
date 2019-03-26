library(TIMP)


### Name: FLIMplots
### Title: Functions to plot FLIM results.
### Aliases: FLIMplots plotHistAmp plotHistNormComp plotIntenImage
###   plotSelIntenImage plotNormComp plotTau
### Keywords: hplot

### ** Examples

## Not run: 
##D  
##D ##############################
##D ## READ IN DATA,  PREPROCESS DATA
##D ##############################
##D 
##D ## data representing only donor tagged
##D 
##D data("donorTagged")
##D 
##D D1 <- preProcess(c001, sel_time=c(25,230))
##D D2 <- preProcess(c003, sel_time=c(25,230))
##D 
##D ## data representing donor-acceptor tagged
##D 
##D data("donorAcceptorTagged")
##D 
##D DA1 <- preProcess(cy005c, sel_time=c(25,230))
##D DA2 <- preProcess(cy006, sel_time=c(25,230))
##D 
##D ##############################
##D ## READ IN MEASURED IRF,  PREPROCESS IRF
##D ##############################
##D 
##D data("mea_IRF")
##D mea_IRF <- baseIRF(mea_IRF, 100, 150)[25:230] 
##D 
##D ##############################
##D ## SPECIFY INITIAL MODEL
##D ##############################
##D 
##D modelC <- initModel(mod_type = "kin", 
##D ## starting values for decays 
##D kinpar=c(1.52, 0.36),
##D ## numerical convolution algorithm to use                     
##D convalg = 2,
##D ## measured IRF                    
##D measured_irf = mea_IRF,
##D ## shift of the irf is fixed
##D parmu = list(0), fixed = list(parmu=1),
##D ## one component represents a pulse-following with the IRF shape
##D cohspec = list(type = "irf"),
##D ## parallel kinetics                     
##D seqmod=FALSE,
##D ## decay parameters are non-negative 
##D positivepar=c("kinpar"),
##D title="Global CFP bi-exp model with pulse-follower")
##D 
##D ##############################
##D ## FIT MODEL FOR DONOR ONLY DATA
##D ##############################
##D 
##D fitD <- fitModel(list(D1,D2),
##D                  list(modelC),
##D                  ## estimate the linear coeefficients per-dataset
##D                  modeldiffs = list(linkclp=list(1,2)),
##D                  opt=kinopt(iter=1, linrange = 10,
##D                    addfilename = TRUE,
##D                    output = "pdf",
##D                    makeps = "globalD",
##D                    notraces = TRUE,
##D                    selectedtraces = seq(1, length(c001@x2), by=11),
##D                    summaryplotcol = 4, summaryplotrow = 4, 
##D                    ylimspec = c(1, 2.5),
##D                    xlab = "time (ns)", ylab = "pixel number", 
##D                    FLIM=TRUE))
##D 
##D ##############################
##D ## FIT MODEL FOR DONOR-ACCEPTOR DATA
##D ##############################
##D 
##D fitDA <- fitModel(list(DA1,DA2),
##D                   list(modelC),
##D                   ## estimate the linear coeefficients per-dataset
##D                  modeldiffs = list(linkclp=list(1,2)),
##D                  opt=kinopt(iter=1, linrange = 10,
##D                    addfilename = TRUE,
##D                    output = "pdf",
##D                    makeps = "globalDA",
##D                    notraces = TRUE,
##D                    selectedtraces = seq(1, length(c001@x2), by=11),
##D                    summaryplotcol = 4, summaryplotrow = 4, 
##D                    ylimspec = c(1, 2.5),
##D                    xlab = "time (ns)", ylab = "pixel number", 
##D                    FLIM=TRUE))
##D 
##D ##############################
##D ## COMPARE THE DECAY RATES 
##D ##############################
##D 
##D parEst(fitD)
##D 
##D parEst(fitDA) 
##D 
##D ##############################
##D ## ADDITIONAL FIGURES 
##D ##############################
##D 
##D par(mfrow=c(2,2), mar=c(1,3,1,12))
##D 
##D par(cex=1.5)
##D plotIntenImage(fitD$currModel, fitD$currTheta, 1, tit="")
##D 
##D par(cex=1.5)
##D plotIntenImage(fitDA$currModel, fitD$currTheta, 1, tit="")
##D 
##D par(cex=1.5)
##D plotIntenImage(fitD$currModel, fitD$currTheta, 2, tit="")
##D 
##D par(cex=1.5)
##D plotIntenImage(fitDA$currModel, fitD$currTheta, 2, tit="")
##D 
##D ###############
##D 
##D plo <- kinopt(ylimspec = c(.25,1.1), imagepal=grey(seq(1,0,length=100)))
##D 
##D par(mfrow=c(2,2), mar=c(1,3,1,12))
##D 
##D par(cex=1.5)
##D plotTau(fitD$currModel, fitD$currTheta, 1, tit="",plotoptions=plo,
##D         lifetimes=FALSE)
##D 
##D par(cex=1.5)
##D plotTau(fitDA$currModel, fitD$currTheta, 1, tit="",plotoptions=plo,
##D         lifetimes=FALSE)
##D 
##D par(cex=1.5)
##D plotTau(fitD$currModel, fitD$currTheta, 2, tit="",plotoptions=plo,
##D         lifetimes=FALSE)
##D 
##D par(cex=1.5)
##D plotTau(fitDA$currModel, fitD$currTheta, 2, tit="", plotoptions=plo,
##D         lifetimes=FALSE)
##D 
## End(Not run)



