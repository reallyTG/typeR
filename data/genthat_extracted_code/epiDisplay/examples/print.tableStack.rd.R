library(epiDisplay)


### Name: print tableStack
### Title: Print tableStack object
### Aliases: print.tableStack
### Keywords: database

### ** Examples

data(Attitudes)
tableStack(qa1:qa18, dataFrame=Attitudes) -> a
print(a)
data(Ectopic)
tableStack(hia, gravi, by=outc, dataFrame=Ectopic) -> b
print(b)



