library(vegetarian)


### Name: turnover
### Title: Turnover Rate per Sample
### Aliases: turnover

### ** Examples

data(simesants)
turnover(simesants[,-1])
turnover(simesants[,-1],q=2,boot=TRUE)
turnover(simesants[,-1],q=2,boot=TRUE,boot.arg=list(num.iter=500))



