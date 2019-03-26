library(sdnet)


### Name: cnNew
### Title: New catNetwork
### Aliases: cnNew
### Keywords: classes graphs

### ** Examples

cnet <- cnNew(
	nodes = c("a", "b", "c"),
	cats = list(c("1","2"), c("1","2"), c("1","2")), 
	pars = list(NULL, c(1), c(1,2)), 
	probs = list(	c(0.2,0.8), 
			list(c(0.6,0.4),c(0.4,0.6)), 
			list(list(c(0.3,0.7),c(0.7,0.3)), 
			list(c(0.9,0.1),c(0.1,0.9))))
	)



