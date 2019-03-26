library(shazam)


### Name: createMutationDefinition
### Title: Creates a MutationDefinition
### Aliases: createMutationDefinition

### ** Examples

# Define hydropathy classes
library(alakazam)
hydropathy <- list(hydrophobic=c("A", "I", "L", "M", "F", "W", "V"),
                   hydrophilic=c("R", "N", "D", "C", "Q", "E", "K"),
                   neutral=c("G", "H", "P", "S", "T", "Y"))
chars <- unlist(hydropathy, use.names=FALSE)
classes <- setNames(translateStrings(chars, hydropathy), chars)

# Create hydropathy mutation definition
md <- createMutationDefinition("Hydropathy", classes)




