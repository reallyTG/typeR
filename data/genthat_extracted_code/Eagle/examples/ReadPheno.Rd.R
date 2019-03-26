library(Eagle)


### Name: ReadPheno
### Title: Read phenotype file
### Aliases: ReadPheno

### ** Examples

# Read in  phenotype data from ./extdata/

# find the full location of the phenotype data 
complete.name <- system.file('extdata', 'pheno.txt', package='Eagle')

pheno_obj <- ReadPheno(filename=complete.name)
  
 ## print a couple of lines of the data file
 head(pheno_obj)




