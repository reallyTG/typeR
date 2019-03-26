library(TDMR)


### Name: tdmEnvTReport
### Title: Make a report plot based on 'envT'
### Aliases: tdmEnvTReport

### ** Examples

           
   ## The best results are read from demo02sonar/demoSonar.RData relative to the TDMR 
   ## package directory.
   path = paste(find.package("TDMR"), "demo02sonar",sep="/");
   envT = tdmEnvTLoad("demoSonar.RData",path);    # loads envT
   source(paste(path,"main_sonar.r",sep="/"));
   envT$tdm$nrun=0;       # =0: don't, >0: do unbiasedRun with opts$NRUN=envT$tdm$nrun
   envT$sCList[[1]]$opts$VERBOSE=1;
   envT <- tdmEnvTReport(envT,1);
   if (!is.null(envT$theFinals)) print(envT$theFinals);




