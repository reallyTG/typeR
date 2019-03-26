library(paleofire)


### Name: plot.pfGridding
### Title: Plot a "pfGridding" object.
### Aliases: plot.pfGridding

### ** Examples

## Not run: 
##D ID=pfSiteSel(continent="North America", l12==1, long>-85)
##D 
##D TR=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D p=pfGridding(TR,age=1000)
##D 
##D plot(p,empty_space=100)
##D 
##D # require(ggplot2)
##D # pp=plot(p,empty_space=100)
##D # pp+ggtitle("my title..")
## End(Not run)



