library(discretization)


### Name: incon
### Title: Computing the inconsistency rate for Chi2 discretization
###   algorithm
### Aliases: incon

### ** Examples

##---- Calculating Inconsistency ----
data(iris)
disiris=chiM(iris,alpha=0.05)$Disc.data
incon(disiris)



