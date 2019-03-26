library(TDMR)


### Name: unbiasedRun
### Title: Perform unbiased runs with best-solution parameters.
### Aliases: unbiasedRun

### ** Examples

   ## Load the best results obtained in a prior tuning for the configuration "sonar_04.conf"
   ## with tuning method "spot". The result envT from a prior run of tdmBigLoop with this .conf
   ## is read from demo02sonar/demoSonar.RData.
   ## Run task main_sonar again with these best parameters, using the default settings from 
   ## tdmDefaultsFill: umode="RSUB", tdm$nrun=5  and tdm$TST.testFrac=0.2.
   path = paste(find.package("TDMR"), "demo02sonar",sep="/")
   envT = tdmEnvTLoad("demoSonar.RData",path);    # loads envT
   source(paste(path,"main_sonar.r",sep="/"));
   envT$tdm$optsVerbosity=1;
   envT$sCList[[1]]$opts$path=path;       # overwrite a possibly older stored path
   envT$spotConfig <- envT$sCList[[1]];
   dataObj <- tdmReadTaskData(envT,envT$tdm);
   envT <- unbiasedRun("sonar_04.conf",envT,dataObj,tdm=envT$tdm);
   print(envT$finals);




