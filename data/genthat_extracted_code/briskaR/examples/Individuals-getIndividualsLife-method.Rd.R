library(briskaR)


### Name: getIndividualsLife
### Title: Method to get Individuals Life information
### Aliases: getIndividualsLife getIndividualsLife,Individuals-method

### ** Examples

# the fifth first individuals states for each time step
data(maize_65)
life<-getIndividualsLife(maize.individuals)
matplot(1:10,life[1:10,],type='l',col=1:5,xlab="source",ylab="states")



