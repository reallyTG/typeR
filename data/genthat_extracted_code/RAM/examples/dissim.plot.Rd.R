library(RAM)


### Name: dissim.plot
### Title: Plot Dissimilarity Matrix Data for Different Methods
### Aliases: dissim.plot dissim.clust.plot dissim.eig.plot
###   dissim.alleig.plot dissim.ord.plot dissim.GOF.plot dissim.tree.plot
###   dissim.pvar.plot
### Keywords: hplot

### ** Examples

data(ITS1, ITS2)
data <- list(ITS1=ITS1, ITS2=ITS2)
# show percent variation for only ITS1 with default methods
dissim.pvar.plot(data=list(ITS1=ITS1))
## Not run: 
##D # show clustering for ITS1 and ITS2 for set methods
##D dissim.clust.plot(data=data, is.OTU=TRUE, stand.method=NULL,
##D                   dist.methods=c("morisita", "bray"),
##D                   clust.methods=c("average", "centroid"))
##D dissim.ord.plot(data=data, is.OTU=TRUE, stand.method="total",
##D                 dist.method="bray")
##D # dissim.alleig.plot returns a ggplot2 object:
##D my.eig.plot <- dissim.alleig.plot(data)
##D class(my.eig.plot) # returns "gg" "ggplot"
##D my.eig.plot # view the plot
##D # update the title, then view the updated plot
##D my.eig.plot <- my.eig.plot + ggtitle("My New Title")
##D # update ggplot theme
##D require("grid")
##D new_theme <-RAM.color()
##D my.eig.plot <- my.eig.plot + new_theme
##D my.eig.plot
##D # save an image (named file.pdf) with GOF values for ITS1 and 
##D # ITS2, using default methods
##D dissim.GOF.plot(data=data, file="~/Documents/my/file")
## End(Not run)



