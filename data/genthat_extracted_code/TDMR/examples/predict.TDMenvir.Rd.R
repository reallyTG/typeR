library(TDMR)


### Name: predict.TDMenvir
### Title: Make a prediction using the last model.
### Aliases: predict.TDMenvir predict.TDMclassifier predict.TDMregressor

### ** Examples

   ## Not run: 
##D    ## This example requires that demo04cpu.r is executed first (it will write demo04cpu.RData)
##D    path <- paste(find.package("TDMR"), "demo01cpu/",sep="/");
##D    tdm <- list(  filenameEnvT="demo04cpu.RData" );   # file with environment envT 
##D    load(paste(path,tdm$filenameEnvT,sep="/"));
##D               
##D    # take only the first 15 records:
##D    newdata=read.csv2(file=paste(path,"data/cpu.csv", sep=""), dec=".")[1:15,];     
##D    z=predict(envT,newdata);
##D    print(z);
##D    
## End(Not run)



