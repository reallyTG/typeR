library(minval)


### Name: orphanMetabolites
### Title: Identify the orphan metabolites of a set of stoichiometric
###   reactions
### Aliases: orphanMetabolites orphanReactants orphanProducts

### ** Examples

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep="\t")

# Identify orphan metabolites
orphanMetabolites(reactionList = glycolysis$REACTION)

# Identify orphan reactants
orphanReactants(reactionList = glycolysis$REACTION)

# Identify orphan products
orphanProducts(reactionList = glycolysis$REACTION)

# Identify orphan metabolites by compartment
orphanMetabolites(reactionList = glycolysis$REACTION, byCompartment = TRUE)



