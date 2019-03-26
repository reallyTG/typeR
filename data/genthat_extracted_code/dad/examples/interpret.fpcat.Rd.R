library(dad)


### Name: interpret.fpcat
### Title: Scores of the 'fpcat' function vs. moments of the densities
### Aliases: interpret.fpcat

### ** Examples

# Alsacian castles with their building year
data(castles)
castyear <- foldert(lapply(castles, "[", 1:4))
fpcayear <- fpcat(castyear, group.name = "year")
interpret(fpcayear)
interpret(fpcayear, moment="var")



