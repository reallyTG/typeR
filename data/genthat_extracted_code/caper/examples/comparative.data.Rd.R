library(caper)


### Name: comparative.data
### Title: Comparative dataset creation
### Aliases: comparative.data print.comparative.data
###   na.omit.comparative.data subset.comparative.data
###   reorder.comparative.data [.comparative.data as.comparative.data
###   caicStyleArgs
### Keywords: utilities

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, 'Species')
print(shorebird)

subset(shorebird, subset=Mat.syst == 'MO')

sandpipers <- grep('Calidris', shorebird$phy$tip.label)
shorebird[-sandpipers, ]

sandpipers <- grep('Calidris', shorebird$phy$tip.label, value=TRUE)
shorebird[sandpipers, ]

shorebird[]
shorebird[,]
shorebird[2:3]
shorebird[, 2:3]
shorebird[1:15, ]
shorebird[1:15, 2:3]



