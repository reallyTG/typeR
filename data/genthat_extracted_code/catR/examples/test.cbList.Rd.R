library(catR)


### Name: test.cbList
### Title: Testing the format of the list for content balancing under
###   dichotomous or polytomous IRT models
### Aliases: test.cbList

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)
 
 # Vector of group membership for 'tcals' data set
 group <- tcals$Group

 # Creation of a correct list with arbitrary proportions
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 # Testing 'cbList'
 test.cbList(cbList, group)

 # Creation of an incorrect list (mismatch in first name)
 cbList <- list(names = c("audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props=c(0.1, 0.2, 0.2, 0.2, 0.3))
 test.cbList(cbList, group)

 # Creation of an incorrect list (mismatch in name of second
 # element)
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        prop = c(0.1, 0.2, 0.2, 0.2, 0.3))
 test.cbList(cbList, group)

 # Creation of an incorrect list (second element shorter than
 # first element)
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
         props=c(0.1, 0.2, 0.2, 0.2))
 test.cbList(cbList, group)

 # Creation of an incorrect list (adding a third element)
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"),  
        props = c(0.1, 0.2, 0.2, 0.2), third = "hi")
 test.cbList(cbList, group)


## Polytomous models ##

 # Creation of an appropriate list for content balancing
 # Equal proprotions across subgroups of items
 cbList <- list(names = c("Group1", "Group2", "Group3", "Group4"), props = rep(1, 4))

 # Creation of a "wrong" list
 cbList2 <- list(names=c("group1","group2"),props = c(1, 1))

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM", cbControl = cbList)

 # Breaking the 'm.GRM' bank
 bank <- breakBank(m.GRM)

 # Testing 'cbList' and 'cbList2'
 test.cbList(cbList, bank$cbGroup)
 test.cbList(cbList2, bank$cbGroup)

 # Generation of an item bank under PCM with 100 items, 4 categories and groups
 m.PCM <- genPolyMatrix(100, 4, "PCM", same.nrCat = TRUE, cbControl = cbList2)
 
 # Breaking the 'm.PCM' bank
 bank2 <- breakBank(m.PCM)

 # Testing 'cbList' and 'cbList2'
 test.cbList(cbList, bank2$cbGroup)
 test.cbList(cbList2, bank2$cbGroup)
 


