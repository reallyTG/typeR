library(minval)


### Name: validateSyntax
### Title: Evaluate if a stoichiometric reaction has a valid syntax
### Aliases: validateSyntax

### ** Examples

# Evaluate the syntaxis for a single reaction
validateSyntax(reactionList = "ADP[c] + Phosphoenolpyruvate[c] => ATP[c] + Pyruvate[c]")

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Evaluating the syntaxis for a set of stoichiometric reactions
validateSyntax(reactionList = glycolysis$REACTION)



