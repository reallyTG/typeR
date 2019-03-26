library(FuzzyStatTra)


### Name: Rho1
### Title: 1-norm distance between fuzzy numbers
### Aliases: Rho1
### Keywords: arith

### ** Examples

# Example 1:
F=SimulCASE1(4)
S=SimulCASE1(5)
F=TransfTra(F)
S=TransfTra(S)
Rho1(F,S)

# Example 2:
F=SimulCASE1(4)
S=SimulCASE1(5)
S=TransfTra(S)
Rho1(F,S)

# Example 3:
F=SimulCASE1(4)
S=SimulCASE1(5)
F=TransfTra(F)
S=TransfTra(S,10)
Rho1(F,S)



