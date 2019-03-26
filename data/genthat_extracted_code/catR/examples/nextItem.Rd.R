library(catR)


### Name: nextItem
### Title: Selection of the next item
### Aliases: nextItem

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)
 
 # Item bank creation with 'tcals' item parameters
 prov <- breakBank(tcals)
 bank <- prov$itemPar
 cbGroup <- prov$cbGroup

 ## MFI criterion

 # Selecting the next item, current ability estimate is 0
 nextItem(bank, theta = 0) # item 63 is selected

 # Selecting the next item, current ability estimate is 0 and item 63 is removed
 nextItem(bank, theta = 0, out = 63) # item 10 is selected

 # Selecting the next item, current ability estimate is 0 and items 63 and 10 are 
 # removed
 nextItem(bank, theta = 0, out = c(63, 10)) # item 62 is selected

 # Item exposure control by selecting three items (selected item will be either 10, 62 
 # or 63)
 nextItem(bank, theta = 0, randomesque = 3)

 # Fixing the random seed for randomesque selection
 nextItem(bank, theta = 0, randomesque = 3, random.seed = 1)


 ## bOpt method

 # Selecting the next item, current ability estimate is 0
 nextItem(bank, theta = 0, criterion = "bOpt") # item 24 is selected

 # Selecting the next item, current ability estimate is 0 and item 24 is removed
 nextItem(bank, theta = 0, out = 24, criterion = "bOpt")


 ## thOpt method

 # Selecting the next item, current ability estimate is 0
 nextItem(bank, theta = 0, criterion = "thOpt") # item 76 is selected

 # Selecting the next item, current ability estimate is 0 and item 76 is removed
 nextItem(bank, theta = 0, out = 76, criterion = "thOpt") # item 70 is selected


 ## MLWI and MPWI methods

 # Selecting the next item, current response pattern is 0 and item 63 was administered 
 # first
 nextItem(bank, x = 0, out = 63, criterion = "MLWI") 
 nextItem(bank, x = 0, out = 63, criterion = "MPWI")

 # Selecting the next item, current response pattern is (0,1) and item 19 is removed
 nextItem(bank, x = c(0, 1), out = c(63, 19), criterion = "MLWI")
 nextItem(bank, x = c(0, 1), out = c(63, 19), criterion = "MPWI")

## No test: 

 ## MEI method

 # Selecting the next item, current response pattern is 0 and item 63 was administered 
 # first
 # Ability estimation by WL method
 th <- thetaEst(rbind(bank[63,]), 0, method = "WL")
 nextItem(bank, x = 0, out = 63, theta = th, criterion = "MEI") # item 49 is selected

 # With Fisher information
 nextItem(bank, x = 0, out = 63, theta = th, criterion = "MEI", infoType = "Fisher") 
   # item 10 is selected


 ## MEPV method

 # Selecting the next item, current response pattern is 0 and item 63 was administered 
 # first
 # Ability estimation by WL method
 nextItem(bank, x = 0, out = 63, theta = th, criterion = "MEPV") # item 19 is selected


 ## KL and KLP methods

 # Selecting the next item, current response pattern is 0 and item 63 was administered 
 # first
 # Ability estimation by WL method
 nextItem(bank, x = 0, out = 63, theta = th, criterion = "KL") # item 19 is selected
 nextItem(bank, x = 0, out = 63, theta = th, criterion = "KLP") # item 44 is selected


## GDI and GDIP methods

 # Selecting the next item, current response pattern is 0 and item 63 was administered 
 # first
 nextItem(bank, x = 0, out = 63, criterion = "GDI") # item 49 is selected
 nextItem(bank, x = 0, out = 63, criterion = "GDIP") # item 44 is selected


 ## Progressive method

 # Selecting the next item, current ability estimate is 0 and item 63 was administered 
 # first
 # (default options: "length" rule with "thr = 20")
 nextItem(bank, out = 63, theta = 0, criterion = "progressive") 
 nextItem(bank, out = 63, theta = 0, criterion = "progressive")
  # result can be different!


 ## Proportional method

 # Selecting the next item, current ability estimate is 0 and item 63 was administered 
 # first
 # (default options: "length" rule with "thr = 20")
 nextItem(bank, out = 63, theta = 0, criterion = "proportional") 
 nextItem(bank, out = 63, theta = 0, criterion = "proportional")
  # result can be different!


 ## Random method

 # Selecting the next item, item 63 was administered first
 nextItem(bank, out = 63, criterion = "random") 
 nextItem(bank, out = 63, criterion = "random")  # may produce a different result


 ## Content balancing

 # Creation of the 'cbList' list with arbitrary proportions
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 # Selecting the next item, MFI criterion, current ability estimate is 0, items 12, 33, 
 # 46 and 63 previously administered
 nextItem(bank, theta = 0, out = c(12, 33, 46, 63), cbControl = cbList, 
          cbGroup = cbGroup)  # item 70 is selected


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Current ability estimate is 0
 # Selecting the next item, current response pattern is 1 and item 70 was administered 
 # first

 ## MFI method
 nextItem(m.GRM, model = "GRM", theta = 0, criterion = "MFI", out = 70)

 ## Progressive method
 nextItem(m.GRM, model = "GRM", theta = 0, criterion = "progressive", out = 70)

 ## KL method
 nextItem(m.GRM, model = "GRM", theta = 0, criterion = "KL", out = 70, x = 1)

 ## MFI with content balancing
 cbList <- list(names = c("Audio1","Audio2","Written1","Written2", "Written3"), 
        props = c(0.1,0.2,0.2,0.2,0.3))
 m.GRM<-genPolyMatrix(100, 4, model = "GRM", cbControl = cbList)
 bank<-breakBank(m.GRM)
 nextItem(bank$itemPar, model = "GRM", theta = 0, criterion = "MFI", out = 70,
  cbControl = cbList, cbGroup = bank$cbGroup)


 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Current ability estimate is 0
 # Selecting the next item, current response pattern is 1 and item 15 was administered 
 # first

 ## MFI method
 nextItem(cat_pav, model = "GPCM", theta = 0, criterion = "MFI", out = 15)

 ## Progressive method
 nextItem(cat_pav, model = "GPCM", theta = 0, criterion = "progressive", out = 15)

 ## KL method
 nextItem(cat_pav, model = "GPCM", theta = 0, criterion = "KL", out = 15, x = 1)

 ## MFI with content balancing
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props = c(0.1, 0.2, 0.2, 0.2, 0.3))
 cat_pav<-genPolyMatrix(100, 4, model = "GPCM", cbControl = cbList)
 bank<-breakBank(cat_pav)
 nextItem(bank$itemPar, model = "GPCM", theta = 0, criterion = "MFI", out = 15, 
          cbControl = cbList, cbGroup = bank$cbGroup)
 
## End(No test)



