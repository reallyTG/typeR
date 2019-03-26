library(psych)


### Name: make.keys
### Title: Create a keys matrix for use by score.items or cluster.cor
### Aliases: make.keys keys2list selectFromKeys
### Keywords: multivariate models

### ** Examples

data(attitude)  #specify the items by location
 key.list <- list(all=c(1,2,3,4,-5,6,7),
                  first=c(1,2,3),
                  last=c(4,5,6,7))
 keys <- make.keys(7,key.list,item.labels = colnames(attitude))
 keys
 #now, undo this 
new.keys.list <- keys2list(keys)  #note, these are now given the variable names

select <- selectFromKeys(key.list)

 
 #scores <- score.items(keys,attitude)
 #scores
 
 data(bfi)
 #first create the keys by location (the conventional way)
 keys.list <- list(agree=c(-1,2:5),conscientious=c(6:8,-9,-10),
 extraversion=c(-11,-12,13:15),neuroticism=c(16:20),openness = c(21,-22,23,24,-25))   
 keys <- make.keys(25,keys.list,item.labels=colnames(bfi)[1:25])
 new.keys.list <- keys2list(keys)  #these will be in the form of variable names
 
 #alternatively, create by a mixture of names and locations 
 keys.list <- list(agree=c("-A1","A2","A3","A4","A5"),
conscientious=c("C1","C2","C2","-C4","-C5"),extraversion=c("-E1","-E2","E3","E4","E5"),
neuroticism=c(16:20),openness = c(21,-22,23,24,-25)) 
keys <- make.keys(bfi,keys.list) #specify the data file to be scored (bfi)
#or
keys <- make.keys(colnames(bfi),keys.list) #specify the names of the variables to be used
#or
#specify the number of variables to be scored and their names in all cases
keys <- make.keys(28,keys.list,colnames(bfi)) 


 scores <- scoreItems(keys,bfi)
 summary(scores)




