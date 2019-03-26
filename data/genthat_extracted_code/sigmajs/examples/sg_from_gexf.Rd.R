library(sigmajs)


### Name: sg_from_gexf
### Title: Graph from GEXF file
### Aliases: sg_from_gexf

### ** Examples

gexf <- system.file("examples/arctic.gexf", package = "sigmajs")

sigmajs() %>% 
  sg_from_gexf(gexf) 




