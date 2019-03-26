library(apex)


### Name: multiphyDat-class
### Title: multiphyDat: class for multiple gene data
### Aliases: multiphyDat-class multiphyDat

### ** Examples

data(Laurasiatherian)

## empty object
new("multiphyDat")

## simple conversion with nicely ordered output
## Not run: 
##D genes <- list(gene1=subset(Laurasiatherian,,1:1600, FALSE),
##D     gene2=subset(Laurasiatherian,,1601:3179, FALSE))
##D x <- new("multiphyDat", genes)
##D x
## End(Not run)

## trickier conversion with missing sequences / wrong order
genes <- list(gene1=subset(Laurasiatherian,1:40),
    gene2=subset(Laurasiatherian,8:47))
x <- new("multiphyDat", genes)
x




