library(RNetLogo)


### Name: NLGetGraph
### Title: Captures a network.
### Aliases: NLGetGraph
### Keywords: interface NLGetGraph RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D model.path <- 
##D "/models/Sample Models/Networks/Preferential Attachment.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D NLDoCommand(4, "go")
##D graph1 <- NLGetGraph()
##D plot(graph1, layout=layout.kamada.kawai, vertex.label=V(graph1)$name,
##D      vertex.shape="rectangle", vertex.size=20, asp=FALSE)
## End(Not run)



