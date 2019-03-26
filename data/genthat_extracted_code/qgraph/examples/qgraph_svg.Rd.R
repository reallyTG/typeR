library(qgraph)


### Name: qgraph.svg
### Title: qgraph.svg
### Aliases: qgraph.svg
### Keywords: qgraph SVG

### ** Examples

## Not run: 
##D #### VISUALIZE CORRELATION MATRIX ###
##D eta=matrix(rnorm(200*5),ncol=5)
##D lam=matrix(0,nrow=100,ncol=5)
##D for (i in 1:5) lam[(20*i-19):(20*i),i]=rnorm(20,0.7,0.3)
##D eps=matrix(rnorm(200*100),ncol=100)
##D Y=eta%*%t(lam)+eps
##D 
##D tooltips=paste("item",1:100)
##D groups=list(1:20,21:40,41:60,61:80,81:100)
##D names(groups)=paste("Factor",LETTERS[1:5])
##D # Run qgraph:
##D qgraph.svg(cor(Y),groups=groups,tooltips=tooltips,vsize=3)
## End(Not run)



