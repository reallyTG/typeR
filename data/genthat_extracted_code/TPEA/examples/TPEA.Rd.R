library(TPEA)


### Name: TPEA
### Title: Statistical test and calculate the significance
### Aliases: TPEA

### ** Examples

##Randomly generated interested gene set
ViewLatestTime()
##If you want to use the latest information,please run "UPDATE()".
DEGs<-sample(100:10000,10);
DEG<-as.matrix(DEGs);
##Set the times of perturbation
number<-50;
##Calculate the observed statistic
scores<-AUEC(DEG);
##Significant computational
FDR_method<-"fdr";
results<-TPEA(DEG,scores,number,FDR_method);



