library(TreeSearch)


### Name: ReadTntTree
### Title: Parse TNT Tree
### Aliases: ReadTntTree TNTText2Tree

### ** Examples

{
  ## Not run: 
##D   # TNT read a matrix from c:/myproject/tnt/coding1/dataset.nex
##D   # The results of an analysis were written to c:/myproject/tnt/output/results1.tnt
##D   # results1.tnt will contain a hard-coded reference to 
##D   # "c:/myproject/tnt/coding1/dataset.nex"
##D   
##D   getwd() # Gives the current working directory
##D   
##D   # Say that working directory is c:/myproject, which perhaps corresponds to a
##D   # Git repository.
##D   # This directory may be saved into another location by collaborators, or on a 
##D   # different filesystem by a continuous integration platform.
##D   
##D   # Works on local machine but not elsewhere:
##D   ReadTntTree('tnt/output/results1.tnt')
##D   
##D   # Takes only the filename from the results
##D   ReadTntTree('tnt/output.results1.tnt', 'tnt/coding1')
##D   
##D   # Uses the last three elements of c:/myproject/tnt/coding1/dataset.nex
##D   #                                               3     2       1
##D   # '.' means "relative to the current directory", which is c:/myproject
##D   ReadTntTree('tnt/output/results1.tnt', '.', 3)
##D   
##D   # If the current working directory was c:/myproject/rscripts/testing,
##D   # you could navigate up the directory path with '..':
##D   ReadTntTree('../../tnt/output/results1.tnt', '../..', 3)
##D   
##D   
## End(Not run)
}




