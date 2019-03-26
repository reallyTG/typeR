library(stosim)


### Name: DetailOpLines
### Title: Multiple OpLine Simulation Detail
### Aliases: DetailOpLines
### Keywords: model

### ** Examples

GT_1 <- EventElement("GasTurbine2",1,101,"W",2562.5,0.95,0, "L",1.4,0.86,0,87)
seedVec<-GT_1[,length(GT_1)]
GT_2<-cbind(GT_1[,-length(GT_1)],"Seed"=seedVec*11)
## note simulation drastically reduced for example run
GT_1_sh<-SimHistory(GT_1,10,10)
GT_2_sh<-SimHistory(GT_2,10,10)
Model<-list(GT_1_sh, GT_2_sh)
Names<-c("GT1", "GT2")
TurbineArray<-DetailOpLines(Model,Names)



