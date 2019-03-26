library(GGEBiplots)


### Name: stattable
### Title: Produce a two-way summary table of results
### Aliases: stattable
### Keywords: 2way GGEBiplotGUI means statistics summary table

### ** Examples

simdata<-data.frame(expand.grid(Genotype=1:10,Environment=1:10,Rep=1:3),Outcome=rnorm(300))
meantab<-stattable(simdata$Genotype,simdata$Environment,simdata$Outcome,FUN=mean,na.rm=TRUE)
GGEPlot(GGEModel(meantab))



