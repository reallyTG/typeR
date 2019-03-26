library(benford.analysis)


### Name: getSuspects
### Title: Gets the 'suspicious' observations according to Benford's Law
### Aliases: getSuspects

### ** Examples

data(lakes.perimeter) #gets data
lk <- benford(lakes.perimeter[,1]) #generates benford object
suspects <- getSuspects(lk, lakes.perimeter)



