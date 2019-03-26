library(sim1000G)


### Name: generateRecombinationDistances
### Title: Generate inter-recombination distances using a chi-square model.
###   Note this are the distances between two succesive recombination
###   events and not the absolute positions of the events. To generate the
###   locations of the recombination events see the example below.
### Aliases: generateRecombinationDistances

### ** Examples


library("sim1000G")

distances = generateRecombinationDistances(20)


positions_of_recombination = cumsum(distances)

if(0) hist(generateRecombinationDistances(20000),n=100)




