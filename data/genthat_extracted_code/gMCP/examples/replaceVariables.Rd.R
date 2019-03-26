library(gMCP)


### Name: replaceVariables
### Title: Replaces variables in a general graph with specified numeric
###   values
### Aliases: replaceVariables
### Keywords: graphs print

### ** Examples



graph <- HungEtWang2010()
## Not run: 
##D replaceVariables(graph)
## End(Not run)
replaceVariables(graph, list("tau"=0.5,"omega"=0.5, "nu"=0.5))
replaceVariables(graph, list("tau"=c(0.1, 0.5, 0.9),"omega"=c(0.2, 0.8), "nu"=0.4))




