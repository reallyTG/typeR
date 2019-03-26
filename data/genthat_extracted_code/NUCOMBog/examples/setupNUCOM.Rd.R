library(NUCOMBog)


### Name: setupNUCOM
### Title: make setupNUCOM
### Aliases: setupNUCOM
### Keywords: NUCOMBog

### ** Examples

## Not run: 
##D #Define complete file path in setup
##D for LINUX: ~/home/...../data/ ! pay attention to the last "/"
##D for Windows_ C://..//data// ! pay attention to the last "//"
##D 
##D ##Single core setup:
##D test_setup_singlecore <- setupNUCOM(mainDir="/home/jeroen/NUCOMBog_data/",
##D                                      climate="ClimLVMhis.txt",
##D                                      environment="EnvLVMhis.txt",
##D                                      inival="inivalLVMhis.txt",
##D                                      start=1766,
##D                                      end=1999,
##D                                      type=c("NEE","WTD"),
##D                                      parallel=F)
##D 
##D ## Multi core setup:
##D names<-c("CO2ref","gram_Beta","eric_MaxGr")
##D 
##D nparvector<-50
##D initialParameters <- matrix(runif(n=length(names)*nparvector,
##D                    min=c(300,0.1,40),
##D                    max=c(500,1,80)),
##D                    nrow=length(names))
##D initialParameters<-data.frame(names,initialParameters)
##D names(initialParameters)<-c("names",rep("values",nparvector))
##D initialParameters$names<-as.character(initialParameters$names)
##D 
##D test_setup <- setupNUCOM(mainDir="/home/jeroen/NUCOMBog_data/",
##D                           climate="ClimLVMhis.txt",
##D                           environment="EnvLVMhis.txt",
##D                           inival="inivalLVMhis.txt",
##D                           start=1766,
##D                           end=1999,
##D                           type=c("NEE","WTD"),
##D                           parallel=T,
##D                           numFolders=nparvector,
##D                           separate=F,
##D                           startval=1)
##D 
## End(Not run)



