library(TDMR)


### Name: tdmROCRbase
### Title: Single plot of ROC, lift or other chart for a 'TDMclassifier'
###   object.
### Aliases: tdmROCRbase

### ** Examples

#*# --------- demo/demo05ROCR.r ---------
#*# Run task SONAR with "area under ROC curve" as performance measure (rgain.type="arROC").
#*# Other settings are similar to demo01-1sonar.r (level 1 of TDMR).
#*# Finally, plot ROC curve for validataion data set and 
#+#          plot lift chart for training data set
#*#
    path <- paste(find.package("TDMR"), "demo02sonar",sep="/");
    #path <- paste("../inst", "demo02sonar",sep="/");

    source(paste(path,"main_sonar.r",sep="/"));    # defines readTrnSonar

    controlDM <- function() {
      #
      # settings for the DM process (former sonar_00.apd file): 
      # (see ?tdmOptsDefaultsSet for a complete list of all default settings 
      # and many explanatory comments)
      #
      opts = list(path = path,
                  dir.data = "data",            # relative to path
                  filename = "sonar.txt",
                  READ.TrnFn = readTrnSonar,    # defined in main_sonar.r
                  data.title = "Sonar Data",
                  NRUN =  1,
                  rgain.type = "arROC",
                  VERBOSE = 2
      );
      opts <- setParams(opts, defaultOpts(), keepNotMatching = TRUE);
    }
    
    opts <- controlDM();
    result <- main_sonar(opts);     
    
    tdmGraphicNewWin(opts);
    cat("Area under ROC-curve for validation data set: ",
        tdmROCRbase(result),"\n");                                # side effect: plot ROC-curve
    tdmGraphicNewWin(opts);
    cat("Area under lift curve for  training data set: ",
        tdmROCRbase(result,dataset="training",typ="lift"),"\n");  # side effect: plot lift chart



