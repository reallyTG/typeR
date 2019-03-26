library(sim1000G)


### Name: setRecombinationModel
### Title: Set recombination model to either poisson (no interference) or
###   chi-square.
### Aliases: setRecombinationModel

### ** Examples



generateUniformGeneticMap()

do_plots = 0

setRecombinationModel("chisq")
if(do_plots == 1)
 hist(generateRecombinationDistances(100000),n=200)

setRecombinationModel("poisson")
if(do_plots == 1)
 hist(generateRecombinationDistances(100000),n=200)




