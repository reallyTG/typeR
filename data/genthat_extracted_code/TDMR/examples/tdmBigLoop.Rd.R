library(TDMR)


### Name: tdmBigLoop
### Title: Tuning and unbiased evaluation in a big loop.
### Aliases: tdmBigLoop

### ** Examples

#*# This demo shows a complete tuned data mining process (level 3 of TDMR) where 
#*# the data mining task is the classification task SONAR (from UCI repository, 
#*# http://archive.ics.uci.edu/ml/datasets/Connectionist+Bench+%28Sonar,+Mines+vs.+Rocks%29).
#*# The data mining process is in main_sonar.r, which calls tdmClassifyLoop and tdmClassify
#*# with Random Forest as the prediction model. 
#*# The three parameter to be tuned are CUTOFF1, CLASSWT2 and XPERC, as specified 
#*# in controlSC() (control_sonar.r). The tuner used here is LHD.  
#*# Tuning runs are rather short, to make the example run quickly. 
#*# Do not expect good numeric results. 
#*# See demo/demo03sonar_B.r for a somewhat longer tuning run, with two tuners SPOT and LHD.

  ## path is the dir with data and main_*.r file:
  path <- paste(find.package("TDMR"), "demo02sonar",sep="/");
  #path <- paste("../../inst", "demo02sonar",sep="/");

  ## control settings for TDMR
  tdm <- list( mainFunc="main_sonar"
             , runList = c("sonar_04.conf")
             , umode="CV"              # { "CV" | "RSUB" | "TST" | "SP_T" }
             , tuneMethod = c("lhd")
             , filenameEnvT="exBigLoop.RData"   # file to save environment envT 
             , nrun=1, nfold=2         # repeats and CV-folds for the unbiased runs
             , nExperim=1
             , optsVerbosity = 0       # the verbosity for the unbiased runs
             );
  source(paste(path,"main_sonar.r",sep="/"));    # main_sonar, readTrnSonar
## Don't show: 
  #*# This demo is for "R CMD check" (runs in half the time) 
  source(paste(path,"control_sonar_check.r",sep="/")); # controlDM, controlSC
## End(Don't show)
## No test: 
  #*# This demo is for example and help (more meaningful, a bit higher budget)
  source(paste(path,"control_sonar.r",sep="/")); # controlDM, controlSC
## End(No test)
  
  
  ctrlSC <- controlSC();
  ctrlSC$opts <- controlDM();
  
  # construct envT from settings given in tdm & sCList
  envT <- tdmEnvTMakeNew(tdm,sCList=list(ctrlSC));
  dataObj <- tdmReadTaskData(envT,envT$tdm);
  envT <- tdmBigLoop(envT,dataObj=dataObj);     # start the big tuning loop 



