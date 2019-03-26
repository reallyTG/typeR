library(abcdeFBA)


### Name: FBA_solve
### Title: FBA_solve, a function to solve CBM problems
### Aliases: 'solve FBA problem' FBA_solve

### ** Examples
# Flux Balance Analysis performed on a core-metabolism model of E.coli
data(Ecoli_core)
FBA_solve(fba_object=Ecoli_core,precision=6)



