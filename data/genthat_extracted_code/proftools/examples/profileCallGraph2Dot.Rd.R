library(proftools)


### Name: profileCallGraph2Dot
### Title: Write Call Graph for Rprof Profile Data to Graphviz Dot File
### Aliases: profileCallGraph2Dot
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
tmp <- tempfile()
profileCallGraph2Dot(pd, filename = tmp)
file.show(tmp)
unlink(tmp)

## Not run: 
##D ## If you have graphviz installed on a UNIX-like system
##D ## then in R do:
##D 
##D tmp.dot <- tempfile()
##D tmp.pdf <- tempfile()
##D 
##D profileCallGraph2Dot(pd, filename = tmp.dot)
##D system(sprintf("dot -Tpdf -o##D 
##D browseURL(sprintf("file://##D 
##D 
##D profileCallGraph2Dot(pd, filename = tmp.dot)
##D system(sprintf("dot -Tpdf -o##D 
##D browseURL(sprintf("file://##D 
##D 
##D unlink(tmp.dot)
##D unlink(tmp.pdf)
##D   
## End(Not run)



