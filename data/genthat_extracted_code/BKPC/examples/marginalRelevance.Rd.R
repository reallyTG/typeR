library(BKPC)


### Name: marginalRelevance
### Title: Marginal Relevance
### Aliases: marginalRelevance

### ** Examples



data(microarray)

profiles <- as.matrix(microarray[, -2309])
tumourType <-  microarray[, 2309]
 
 margRelv <- marginalRelevance(profiles, tumourType)

# plot 30 gene profiles with highest marginal relevance score
 plot(margRelv, type = "parallelcoord", n.feat = 50, col = tumourType )

 
## Not run: 
##D # another example: wine data from gclus
##D library(gclus)
##D data(wine)
##D dt <- as.matrix(wine[, -1])
##D colnames(dt) <- names(wine[, -1])
##D 
##D label <- as.factor(wine[, 1])
##D 
##D 
##D margRelv <- marginalRelevance(dt, label)
##D 
##D #variables in order of their MR score
##D colnames(dt)[ margRelv$bestVars]
##D 
##D 
##D cparcoord(dt, order = margRelv$bestVars, col = label)
##D cpairs(dt, order = margRelv$bestVars, col = label)
##D 
## End(Not run)



