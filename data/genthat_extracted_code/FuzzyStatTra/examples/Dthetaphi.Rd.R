library(FuzzyStatTra)


### Name: Dthetaphi
### Title: Mid/spr distance between fuzzy numbers
### Aliases: Dthetaphi
### Keywords: arith

### ** Examples

# Example 1:
F=SimulCASE1(10)
S=SimulCASE1(20)
F=TransfTra(F)
S=TransfTra(S)
Dthetaphi(F,S,1,5,1)

# Example 2:
F=SimulCASE1(10)
S=SimulCASE1(10)
Dthetaphi(F,S,2,1,1/3)

# Example 3:
F=SimulCASE1(10)
S=SimulCASE1(10)
F=TransfTra(F)
S=TransfTra(S,50)
Dthetaphi(F,S,2,1,1)



