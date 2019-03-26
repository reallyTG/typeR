library(nat)


### Name: neuronlistfh
### Title: neuronlistfh - List of neurons loaded on demand from disk or
###   remote website
### Aliases: neuronlistfh neuronlistfh is.neuronlistfh as.neuronlistfh
###   as.neuronlistfh.neuronlist

### ** Examples

## Not run: 
##D kcnl=read.neuronlistfh('http://jefferislab.org/si/nblast/flycircuit/kcs20.rds',
##D 'path/to/my/project/folder')
##D # this will automatically download the neurons from the web the first time
##D # it is run
##D plot3d(kcnl)
## End(Not run)
## Not run: 
##D # create neuronlistfh object backed by filehash with one file per neuron
##D # by convention we create a subfolder called data in which the objects live
##D kcs20fh=as.neuronlistfh(kcs20, dbdir='/path/to/my/kcdb/data')
##D plot3d(subset(kcs20fh,type=='gamma'))
##D # ... and, again by convention, save the neuronlisfh object next to filehash 
##D # backing database
##D write.neuronlistfh(kcs20fh, file='/path/to/my/kcdb/kcdb.rds')
##D 
##D # in a new session
##D read.neuronlistfh("/path/to/my/kcdb/kcdb.rds")
##D plot3d(subset(kcs20fh, type=='gamma'))
## End(Not run)



