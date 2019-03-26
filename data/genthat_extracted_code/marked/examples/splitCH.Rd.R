library(marked)


### Name: splitCH
### Title: Split/collapse capture histories
### Aliases: splitCH collapseCH

### ** Examples

data(dipper)
# following returns a matrix
chmat=splitCH(dipper$ch)
# following returns the original dataframe with the ch split into columns
newdipper=splitCH(data=dipper)
# following collapses chmat
ch=collapseCH(chmat)
# following finds fields in newdipper and creates ch
newdipper$ch=NULL
newdipper=collapseCH(data=newdipper)



