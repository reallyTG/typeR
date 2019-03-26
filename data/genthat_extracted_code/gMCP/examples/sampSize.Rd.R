library(gMCP)


### Name: sampSize
### Title: Sample size calculations
### Aliases: sampSize

### ** Examples


## Not run: 
##D graph <- BonferroniHolm(4)
##D powerReqFunc <- function(x) { (x[1] && x[2]) || x[3] }
##D #TODO Still causing errors / loops.
##D #sampSize(graph, alpha=0.05, powerReqFunc, target=0.8, mean=c(6,4,2) )
##D #sampSize(graph, alpha=0.05, powerReqFunc, target=0.8, mean=c(-1,-1,-1), nsim=100)
##D sampSize(graph, esf=c(1,1,1,1), effSize=c(1,1,1,1), 
##D          corr.sim=diag(4), powerReqFunc=powerReqFunc, target=0.8, alpha=0.05)
##D powerReqFunc=list('all(x[c(1,2)])'=function(x) {all(x[c(1,2)])},
##D                   'any(x[c(0,1)])'=function(x) {any(x[c(0,1)])})
##D sampSize(graph=graph, 
##D          effSize=list("Scenario 1"=c(2, 0.2, 0.2, 0.2), 
##D                       "Scenario 2"=c(0.2, 4, 0.2, 0.2)), 
##D          esf=c(0.5, 0.7071067811865476, 0.5, 0.7071067811865476),
##D          powerReqFunc=powerReqFunc, 
##D          corr.sim=diag(4), target=c(0.8, 0.8), alpha=0.025)
## End(Not run)



