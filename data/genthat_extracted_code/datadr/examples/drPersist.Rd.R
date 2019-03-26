library(datadr)


### Name: drPersist
### Title: Persist a Transformed 'ddo' or 'ddf' Object
### Aliases: drPersist

### ** Examples

bySpecies <- divide(iris, by = "Species")

# Create the transformation and add it to bySpecies
bySpeciesSepal <- addTransform(bySpecies, function(x) x[,c("Sepal.Length", "Sepal.Width")])

# Note the transformation is 'pending' a data action
bySpeciesSepal

# Make the tranformation permanent (persistent)
bySpeciesSepalPersisted <- drPersist(bySpeciesSepal)

# The transformation no longer pending--but a permanent part of the new ddo
bySpeciesSepalPersisted
bySpeciesSepalPersisted[[1]]



