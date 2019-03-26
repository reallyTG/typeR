library(rcdk)


### Name: load.molecules
### Title: Load Molecular Structures From Disk
### Aliases: load.molecules iload.molecules
### Keywords: programming

### ** Examples

## Not run: 
##D 
##D ## load a single file
##D amol <- load.molecules('foo.sdf')
##D 
##D ## load multiple files
##D mols <- load.molecules(c('mol1.sdf', 'mol2.smi', 
##D           'https://github.com/rajarshi/cdkr/blob/master/data/set2/dhfr00008.sdf?raw=true'))
##D 
##D ## iterate over a large file
##D moliter <- iload.molecules("big.sdf", type="sdf")
##D while(hasNext(moliter)) {
##D   mol <- nextElem(moliter)
##D   print(get.property(mol, "cdk:Title"))
##D }
## End(Not run)



