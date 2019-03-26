library(Rdimtools)


### Name: aux.graphnbd
### Title: Construct Nearest-Neighborhood Graph
### Aliases: aux.graphnbd

### ** Examples

## Not run: 
##D ## Generate data
##D X = aux.gensamples()
##D 
##D ## Test three different types of neighborhood connectivity
##D nn1 = aux.graphnbd(X,type=c("knn",20))         # knn with k=20
##D nn2 = aux.graphnbd(X,type=c("enn",1))          # enn with radius = 1
##D nn3 = aux.graphnbd(X,type=c("proportion",0.4)) # connecting 40% of edges
##D 
##D ## Visualize
##D par(mfrow=c(1,3))
##D image(nn1$mask); title("knn with k=20")
##D image(nn2$mask); title("enn with radius=1")
##D image(nn3$mask); title("proportion of ratio=0.4")
## End(Not run)




