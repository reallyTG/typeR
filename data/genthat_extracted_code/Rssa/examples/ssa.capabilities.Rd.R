library(Rssa)


### Name: ssa.capabilities
### Title: SSA methods and capabilities check
### Aliases: ssa.capabilities

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Since this is 1d SSA object, everything should be supported except
# gapfilling
print(ssa.capabilities(s))



