library(bio3d)


### Name: bounds.sse
### Title: Obtain A SSE Object From An SSE Sequence Vector
### Aliases: bounds.sse

### ** Examples

## No test: 
   # PDB server connection required - testing excluded

   pdb <- read.pdb("1a7l")
   sse <- pdb2sse(pdb)
   sse.ind <- bounds.sse(sse)
   sse.ind 
## End(No test) 



