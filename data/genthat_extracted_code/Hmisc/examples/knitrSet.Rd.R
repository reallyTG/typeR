library(Hmisc)


### Name: knitrSet
### Title: knitr Setup and plotly Service Function
### Aliases: knitrSet plotlySave
### Keywords: interface

### ** Examples

## Not run: 
##D # Typical call (without # comment symbols):
##D # <<echo=FALSE>>=
##D # require(Hmisc)
##D # knitrSet()
##D # @
##D 
##D knitrSet()    # use all defaults and don't use a graphics file prefix
##D knitrSet('modeling')   # use modeling- prefix for a major section or chapter
##D knitrSet(cache=TRUE, echo=FALSE)  # global default to cache and not print code
##D knitrSet(w=5,h=3.75)   # override default figure width, height
##D 
##D # ```{r chunkname}
##D # p <- plotly::plot_ly(...)
##D # plotlySave(p)   # creates fig.path/chunkname.png
## End(Not run)



