library(tailDepFun)


### Name: AsymVarBR
### Title: Asymptotic variance matrix for the Brown-Resnick process.
### Aliases: AsymVarBR

### ** Examples

locations <- cbind(rep(1:2, 3), rep(1:3, each = 2))
indices <- selectGrid(cst = c(0,1), d = 6, locations = locations, maxDistance = 1)
AsymVarBR(locations, indices, par = c(1.5,3), method = "WLS")



