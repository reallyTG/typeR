library(dad)


### Name: interpret.fmdsd
### Title: Scores of the 'fmdsd' function vs. moments of the densities
### Aliases: interpret.fmdsd

### ** Examples

data(roses)
x <- roses[,c("Sha","Den","Sym","rose")]
rosesfold <- as.folder(x)
result1 <- fmdsd(rosesfold)
interpret(result1)
interpret(result1, moment = "var")
interpret(result1, nscore = 1:2)



