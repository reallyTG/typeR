library(BoolNet)


### Name: symbolicToTruthTable
### Title: Convert a symbolic network into a truth table representation
### Aliases: symbolicToTruthTable
### Keywords: Boolean network symbolic Boolean network conversion

### ** Examples

# Convert a truth table representation into a 
# symbolic representation and back
data(cellcycle)

symbolicNet <- truthTableToSymbolic(cellcycle)
print(symbolicNet)

ttNet <- symbolicToTruthTable(symbolicNet)
print(cellcycle)



