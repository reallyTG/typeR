library(minval)


### Name: metabolites
### Title: Identify the list of metabolites for a set of stoichiometric
###   reactions
### Aliases: metabolites

### ** Examples

# Extract metabolites of a stoichiometric reaction
metabolites(reactionList = "ADP[c] + Phosphoenolpyruvate[c] => ATP[c] + Pyruvate[c]")

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Extract unique metabolites
metabolites(reactionList = glycolysis$REACTION)

#' # Extract unique metabolites without compartments
metabolites(reactionList = glycolysis$REACTION, woCompartment = TRUE)

# Extract all metabolites
metabolites(reactionList = glycolysis$REACTION, uniques = FALSE)



