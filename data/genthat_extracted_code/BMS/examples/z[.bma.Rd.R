library(BMS)


### Name: [.bma
### Title: Extract Parts of a topmod Object
### Aliases: [.bma [.topmod
### Keywords: utilities

### ** Examples

#sample some BMA
 data(datafls)
 mm=bms(datafls[,1:11])
 
#plotConv for all models 
 plotConv(mm)

#plotConv for the best 20 models 
 plotConv(mm[1:20])

#model binary for the second best model 
topmodels.bma(mm[2])

#similar:
as.vector(mm$topmod[2]$bool_binary())

#exactly the same
as.vector(mm[2]$topmod$bool_binary())


#print stats for second best model
print(mm$topmod[2])







