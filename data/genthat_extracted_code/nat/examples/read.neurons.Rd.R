library(nat)


### Name: read.neurons
### Title: Read one or more neurons from file to a neuronlist in memory
### Aliases: read.neurons

### ** Examples

## Not run: 
##D ## Read C. elegans neurons from OpenWorm github repository
##D vds=paste0("VD", 1:13)
##D vdurls=paste0("https://raw.githubusercontent.com/openworm/CElegansNeuroML/",
##D   "103d500e066125688aa7ac5eac7e9b2bb4490561/CElegans/generatedNeuroML/",vds,
##D   ".morph.xml")
##D vdnl=read.neurons(vdurls, neuronnames=vds)
##D plot3d(vdnl)
##D 
##D ## The same, but this time add some metadata to neuronlist
##D # fetch table of worm neurons from wormbase
##D library(rvest)
##D nlurl="http://wormatlas.org/neurons/Individual%20Neurons/Neuronframeset.html"
##D wormneurons = html_table(html(nlurl), fill=TRUE)[[4]]
##D vddf=subset(wormneurons, Neuron%in%vds)
##D rownames(vddf)=vddf$Neuron
##D # attach metadata to neuronlist
##D vdnl=read.neurons(vdurls, neuronnames=vds, df=vddf)
##D # use metadata to plot a subset of neurons
##D clear3d()
##D plot3d(vdnl, grepl("P[1-6].app", Lineage))
## End(Not run)



