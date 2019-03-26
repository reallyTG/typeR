library(minval)


### Name: characterizeReactions
### Title: Characterize stoichiometric reactions by compartments and
###   reaction type
### Aliases: characterizeReactions

### ** Examples

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Characterizing the reactions
characterizeReactions(reactionList = glycolysis$REACTION)



