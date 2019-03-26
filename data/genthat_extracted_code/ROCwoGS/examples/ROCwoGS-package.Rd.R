library(ROCwoGS)


### Name: ROCwoGS-package
### Title: Non-parametric estimation of ROC curves without Gold Standard
### Aliases: ROCwoGS-package ROCwoGS
### Keywords: package

### ** Examples

data(score)
score$r <- (score$r >= 3)
ncutoff<- 20
ROC.est<-NPROCwoGS (score, ncutoff, niter=2000, CIlevel=0.95)
#Print results on R screen
ROC.est
#Calculate area under the curve
AUC<- sum((ROC.est$T.Se[1,-1]+ROC.est$T.Se[1,-(ncutoff+2)])*(ROC.est$T.Sp[1,-1]-ROC.est$T.Sp[1,-(ncutoff+2)])/2)
#Find the optimal cutoff to maximize
#Youden Index
opt.cut<- ROC.est$cutoff[which.max(ROC.est$T.Se[1,]+ROC.est$T.Sp[1,])-1]
# Plot ROC curve
plot(1-ROC.est$T.Sp[1,],ROC.est$T.Se[1,],"l", xlab="1-Specificities",ylab="Sensitivities", main=paste("AUC=", format(AUC, digits=4),
        ", Optimal Cutoff=",opt.cut))        
data.frame(1-ROC.est$T.Sp)[c(3,2),]->ci.tsp
data.frame(ROC.est$T.Se)[c(2,3),]->ci.tse
#Write Sensitivities and Specificities to 
#".csv" files, saved in the R library path
#write.csv(ROC.est$T.Se,
#paste(.Library,"/ROCwoGS/data/T_Se.csv",sep=''))
#write.csv(ROC.est$T.Sp,
#paste(.Library,"/ROCwoGS/data/T_Sp.csv",sep=''))



