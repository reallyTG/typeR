library(dismo)


### Name: kfold
### Title: k-fold partitioning
### Aliases: kfold
### Keywords: spatial

### ** Examples


#library(disdat)
#data(NSWtrain)
## a single species
#srsp1 <- subset(NSWtrain, spid=='srsp1')
#kfold(srsp1, k = 5)

## all species
#k = kfold(NSWtrain, k=5, by=NSWtrain$spid)

#k[NSWtrain$spid=='srsp1']
## each group has the same number of records 
##(except for adjustments if the number of records divided by k is not an integer) 
#table(k[NSWtrain$spid=='srsp1'])
#k[NSWtrain$spid=='ousp5']




