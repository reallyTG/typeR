library(Familias)


### Name: FamiliasLocus
### Title: Creates an object with information on a locus, including its
###   mutation matrices.
### Aliases: FamiliasLocus

### ** Examples

#Simple examples
FamiliasLocus(1:4/10)
FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4),
allelenames= c("A", "B", "C", "D"), name="locus1")

#Modified to include a silent frequency
FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.3, 0.1),
allelenames= c("8", "9", "10", "11", "silent"), name="locus1")

#Mutation rates added
FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4),
allelenames= c("8", "9", "10", "11"), name="locus1", 
femaleMutationRate=0.001, maleMutationRate=0.005)

#Mutation matrices specified directly 
MM <- matrix(c(0.99, 0.005, 0.003, 0.002, 0.005, 0.99, 0.005, 0, 
0, 0.005, 0.99, 0.005, 0.002, 0.003, 0.005, 0.99), 4, 4, byrow=TRUE)
FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4), 
allelenames= c("08", "09", "10", "11"), name="locus1", 
MutationModel = "Custom", MutationMatrix = MM)

#A locus is first created, and then edited
loc <- FamiliasLocus(c(0.2, 0.5, 0.3))
loc2 <- FamiliasLocus(loc, maleMutationRate = 0.001)
FamiliasLocus(loc2, Stabilization = "PM")

#A locus using standard Norwegian frequencies is created
data(NorwegianFrequencies)
FamiliasLocus(NorwegianFrequencies$TH01)



