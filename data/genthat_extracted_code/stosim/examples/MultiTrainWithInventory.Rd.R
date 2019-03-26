library(stosim)


### Name: MultiTrainWithInventory
### Title: Event Handler for Evaluating Multi Train Systems with Backup
###   Inventory Support
### Aliases: MultiTrainWithInventory
### Keywords: model

### ** Examples


data(ChargeTrain)	
Train1<-ChargeTrain		
Train2<-Train1[,-11]	
Train2seeds<-data.frame(Seed=Train1$Seed+200)	
Train2<-cbind(Train2,Train2seeds)	
## note simulation drastically reduced for example run	
Train1_sh<-SimHistory(Train1,200,100)	
Train2_sh<-SimHistory(Train2,200,100)	
ChargeSystem<-list(Train1_sh,Train2_sh)	
ChargeTrainParallelHistory<-DetailOpLines(ChargeSystem)
ChgTwInv<-MultiTrainWithInventory(ChargeTrainParallelHistory, 16, 8, 336)




