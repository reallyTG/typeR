library(PST)


### Name: plot-PSTr
### Title: Plot a PST
### Aliases: plot,PSTf,ANY-method plot,PSTr,ANY-method
### Keywords: methods hplot

### ** Examples

data(s1)
s1 <- seqdef(s1)
S1 <- pstree(s1, L=3)
plot(S1)
plot(S1, horiz=TRUE)
plot(S1, nodePar=list(node.type="path", lab.type="prob", lab.pos=1, lab.offset=2, lab.cex=0.7), 
	edgePar=list(type="triangle"), withlegend=FALSE)



