library(lifecontingencies)


### Name: getDecrements
### Title: Function to return the decrements defined in the mdt class
### Aliases: getDecrements

### ** Examples

#create a new table
tableDecr=data.frame(d1=c(150,160,160),d2=c(50,75,85))
newMdt<-new("mdt",name="testMDT",table=tableDecr)
getDecrements(newMdt)



