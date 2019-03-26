library(PeriodicTable)


### Name: atomProperties
### Title: Atomic Properties
### Aliases: atomColor atomProperties mass rcov rvdw
### Keywords: utilities

### ** Examples

# Display all chemical element properties
data(periodicTable)
periodicTable

# From atomic symbols
mass(c("C","O","H"))
rcov(c("C","O","H"))
rvdw(c("C","O","H"))
atomColor(c("C","O","H"))

# From atomic numbers
mass(c(6, 8, 1))
rcov(c(6, 8, 1))
rvdw(c(6, 8, 1))
atomColor(c(6, 8, 1))

# From atom names
mass(c("CA","OD","H"))
rcov(c("CA","OD","H"))
rvdw(c("CA","OD","H"))
atomColor(c("CA","OD","H"))




