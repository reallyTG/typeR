library(briskaR)


### Name: Individuals plot
### Title: Plot method for Individuals-class
### Aliases: 'Individuals plot' plot,Individuals,ANY-method
###   plot,Individuals,numeric-method plot,Individuals,num-method

### ** Examples

data(maize_65)
plot(maize.individuals)
data(maize_65)
# individuals locations
plot(maize.individuals)
# individuals at time 61
plot(maize.individuals,61)
#individuals at time 61 with the landscape
plot(maize.landscape,maize.individuals,time=61)



