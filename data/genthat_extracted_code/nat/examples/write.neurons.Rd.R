library(nat)


### Name: write.neurons
### Title: Write neurons from a neuronlist object to individual files, or a
###   zip archive
### Aliases: write.neurons

### ** Examples

## Not run: 
##D # write some neurons in swc format
##D write.neurons(Cell07PNs, dir="testwn", format='swc')
##D # write some neurons in Amira hxlineset format
##D write.neurons(Cell07PNs, dir="testwn", format='hxlineset')
##D 
##D # organise new files in directory hierarchy by glomerulus and Scored.By field
##D write.neurons(Cell07PNs,dir="testwn",
##D   subdir=file.path(Glomerulus,Scored.By),format='hxlineset')
##D # ensure that the neurons are named according to neuronlist names
##D write.neurons(Cell07PNs, dir="testwn", files=names(Cell07PNs),
##D   subdir=file.path(Glomerulus,Scored.By),format='hxlineset')
##D # only write a subset
##D write.neurons(subset(Cell07PNs, Scored.By="ACH"),dir="testwn2",
##D   subdir=Glomerulus,format='hxlineset')
##D # The same, but likely faster for big neuronlists
##D write.neurons(Cell07PNs, dir="testwn3",
##D   INDICES=subset(Cell07PNs,Scored.By="ACH",rval='names'),
##D   subdir=Glomerulus,format='hxlineset')
##D # set file name explicitly using a field in data.frame
##D write.neurons(subset(Cell07PNs, Scored.By="ACH"),dir="testwn4",
##D   subdir=Glomerulus, files=paste0(ID,'.am'), format='hxlineset')
## End(Not run)



