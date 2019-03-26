library(kfigr)


### Name: figr
### Title: Code Chunk Reference
### Aliases: figr

### ** Examples

figr("test", type="reference")
figr("test")
figr("test", TRUE, link=FALSE)
if(interactive()){
  require(knitr)
  opts_knit$set(kfigr.prefix=TRUE, kfigr.link=TRUE)
  figr("test")
}



