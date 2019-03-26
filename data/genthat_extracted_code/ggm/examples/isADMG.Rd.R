library(ggm)


### Name: isADMG
### Title: Acyclic directed mixed graphs
### Aliases: isADMG
### Keywords: graphs ancestral graph mixed graph models multivariate

### ** Examples

	## Examples from Richardson and Spirtes (2002)
	a1 <- makeMG(dg=DAG(a~b, b~d, d~c), bg=UG(~a*c))  
	isADMG(a1)    # Not an AG. (a2) p.969    
	a2 <- makeMG(dg=DAG(b ~ a, d~c), bg=UG(~a*c+c*b+b*d))           # Fig. 3 (b1) p.969  
	isADMG(a2)



