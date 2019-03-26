library(BoolNet)


### Name: truthTableToSymbolic
### Title: Convert a network in truth table representation into a symbolic
###   representation
### Aliases: truthTableToSymbolic
### Keywords: Boolean network symbolic Boolean network conversion

### ** Examples

# Convert a truth table representation into a 
# symbolic representation and back
data(cellcycle)

symbolicNet <- truthTableToSymbolic(cellcycle)
print(symbolicNet)

ttNet <- symbolicToTruthTable(symbolicNet)
print(cellcycle)



