library(minval)


### Name: stoichiometricMatrix
### Title: Build the stoichiometric matrix for a set of stoichiometric
###   reactions
### Aliases: stoichiometricMatrix

### ** Examples

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Building the stoichiometric matrix
stoichiometricMatrix(reactionList = glycolysis$REACTION)



