library(timma)


### Name: drawGraph
### Title: Draw graph function
### Aliases: drawGraph

### ** Examples

## Not run: 
##D data(tyner_interaction_binary)
##D data(tyner_sensitivity)
##D y<-tyner_sensitivity[,1]
##D k_selected<-sffs(tyner_interaction_binary, y)$k_sel
##D x<-data.frame(tyner_interaction_binary[, k_selected])
##D #binarize the sensitivity data
##D one<-which(y>0.5)
##D zero<-which(y<=0.5)
##D SENS<-y
##D SENS[one]<-1
##D SENS[zero]<-0
##D draw_data<-cbind(x, SENS)
##D drawGraph(draw_data)
## End(Not run)



