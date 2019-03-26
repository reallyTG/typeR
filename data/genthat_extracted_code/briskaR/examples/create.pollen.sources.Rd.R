library(briskaR)


### Name: create.pollen.sources
### Title: Pollen sources emission simulation
### Aliases: create.pollen.sources

### ** Examples

# simulation of an emission matrix for 20 emitting sources and a emission period of 15 days:
create.pollen.sources(nbOfSource=20,numberOfDay=15)
# simulation of an emission matrix for 1 emitting source and a emission period of 20 days:
pollen.emission<-create.pollen.sources(nbOfSource=1,numberOfDay=20)
plot(pollen.emission[1,],xlab="time unites",ylab="maize crop emission")



