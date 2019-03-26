library(iNextPD)


### Name: ggiNEXT
### Title: ggplot2 extension for an iNextPD object
### Aliases: ggiNEXT ggiNEXT.default ggiNEXT.iNextPD

### ** Examples

# single-assemblage abundance data
data(bird)
bird.phy <- ade4::newick2phylog(bird$tre)
bird.lab <- rownames(bird$abun)
out1 <- iNextPD(bird$abun$North.site, bird.lab, bird.phy, 
        q=1, datatype="abundance", endpoint=400, se=TRUE)
ggiNEXT(x=out1, type=1)
ggiNEXT(x=out1, type=2)
ggiNEXT(x=out1, type=3)

## Not run: 
##D # single-assemblage incidence data with three orders q
##D out2 <- iNextPD(bird$inci$North.site, bird.lab, bird.phy, 
##D         q=c(0,1,2), datatype="incidence_raw", endpoint=25)
##D ggiNEXT(out2, se=FALSE, color.var="order")
##D 
##D # multiple-assemblage abundance data with three orders q
##D out3 <-  iNextPD(bird$abun, bird.lab, bird.phy, 
##D         q=c(0,1,2), datatype="abundance", endpoint=400)
##D ggiNEXT(out3, facet.var="site", color.var="order")
##D ggiNEXT(out3, facet.var="both", color.var="both")
## End(Not run)



