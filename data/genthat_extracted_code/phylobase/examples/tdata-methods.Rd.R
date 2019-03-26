library(phylobase)


### Name: tdata
### Title: Retrieving or updating tip and node data in phylo4d objects
### Aliases: tdata tdata,phylo4d-method tdata<- tdata<-
###   tdata<-,phylo4d-method tdata<-,phylo4d,ANY-method tipData
###   tipData-method tipData tipData,phylo4d-method tipData<- tipData<-
###   tipData<-,phylo4d-method tipData<-,phylo4d,ANY-method nodeData
###   nodeData-method nodeData nodeData,phylo4d-method nodeData<-
###   nodeData<- nodeData<-,phylo4d-method nodeData<-,phylo4d,ANY-method
### Keywords: methods

### ** Examples

   data(geospiza)
   tdata(geospiza)
   tipData(geospiza) <- 1:nTips(geospiza)
   tdata(geospiza)



