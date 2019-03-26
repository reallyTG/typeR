library(abcdeFBA)


### Name: CHANGE_RXN_BOUNDS
### Title: CHANGE_RXN_BOUNDS, Change Reaction Bounds
### Aliases: 'Change Reaction Bounds' CHANGE_RXN_BOUNDS

### ** Examples

#Changing Reaction Bounds, to simulate a reaction deletion.
data(Ecoli_core)	
Ec_mutant<-CHANGE_RXN_BOUNDS(reaction_number=36,fba_object=Ecoli_core,
lb=0,ub=0)	



