library(minval)


### Name: compartments
### Title: Extract the compartments associated to metabolites of a set of
###   stoichiometric reactions.
### Aliases: compartments

### ** Examples

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Extract unique compartments
compartments(reactionList = glycolysis$REACTION)

# Extract all compartments
compartments(reactionList = glycolysis$REACTION, unique = FALSE)

# Extract compartments of metabolites
compartments(reactionList = "H2O[e]")



