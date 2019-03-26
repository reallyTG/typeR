library(FuzzyStatTra)


### Name: Dwablphi
### Title: (\varphi,theta)-wabl/ldev/rdev distance between fuzzy numbers
### Aliases: Dwablphi
### Keywords: arith

### ** Examples

# Example 1:
F=SimulCASE1(3)
S=SimulCASE1(4)
F=TransfTra(F)
S=TransfTra(S)
Dwablphi(F,S,2,1,1)

# Example 2:
F=SimulCASE1(10)
S=SimulCASE1(10)
Dwablphi(F,S)

# Example 3:
F=SimulCASE1(10)
S=SimulCASE1(10)
F=TransfTra(F)
S=TransfTra(S,50)
Dwablphi(F,S,2,1,1)



