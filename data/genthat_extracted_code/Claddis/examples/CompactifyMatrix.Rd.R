library(Claddis)


### Name: CompactifyMatrix
### Title: Collapses matrix to unique character state distributions
### Aliases: CompactifyMatrix
### Keywords: NEXUS

### ** Examples


# Examine the matrix pre-compactification:
Michaux1989$Matrix_1$Matrix

# Examine the weights pre-compactification:
Michaux1989$Matrix_1$Weights

# Compactify the matrix:
Michaux1989compact <- CompactifyMatrix(Michaux1989)

# Examine the matrix post-compactification:
Michaux1989compact$Matrix_1$Matrix

# Examine the weights post-compactification:
Michaux1989compact$Matrix_1$Weights




