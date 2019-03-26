library(dad)


### Name: interpret.fpcad
### Title: Scores of the 'fpcad' function vs. moments of the densities
### Aliases: interpret.fpcad

### ** Examples

data(roses)
rosefold <- as.folder(roses[,c("Sha","Den","Sym","rose")])
result1 <- fpcad(rosefold)
interpret(result1)
interpret(result1, moment = "var")
interpret(result1, moment = "cor")
interpret(result1, nscore = 1:2)



