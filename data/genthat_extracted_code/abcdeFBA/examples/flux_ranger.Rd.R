library(abcdeFBA)


### Name: Flux_Ranger
### Title: Flux_Ranger - a function to create a flux ramp.
### Aliases: Flux_Ranger

### ** Examples

#Creating a ramp for any reaction
data(Ecoli_core)
flux_range<-Flux_Ranger(reaction_number=12,fba_object=Ecoli_core,divs=10)	



