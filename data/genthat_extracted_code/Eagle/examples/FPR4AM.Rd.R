library(Eagle)


### Name: FPR4AM
### Title: Set the false positive rate for 'AM'
### Aliases: FPR4AM

### ** Examples

  ## Not run: 
##D  
##D   # Since the following code takes longer than 5 seconds to run, it has been tagged as dontrun. 
##D   # However, the code can be run by the user. 
##D   #
##D 
##D   #-------------------------
##D   #  Example  
##D   #------------------------
##D 
##D   # read the map 
##D   #~~~~~~~~~~~~~~
##D   
##D   # File is a plain space separated text file with the first row 
##D   # the column headings
##D   complete.name <- system.file('extdata', 'map.txt', 
##D                                    package='Eagle')
##D   map_obj <- ReadMap(filename=complete.name) 
##D 
##D   # read marker data
##D   #~~~~~~~~~~~~~~~~~~~~
##D   # Reading in a PLINK ped file 
##D   # and setting the available memory on the machine for the reading of the data to 8  gigabytes
##D   complete.name <- system.file('extdata', 'geno.ped', 
##D                                      package='Eagle')
##D   geno_obj <- ReadMarker(filename=complete.name,  type='PLINK', availmemGb=8) 
##D  
##D   # read phenotype data
##D   #~~~~~~~~~~~~~~~~~~~~~~~
##D 
##D   # Read in a plain text file with data on a single trait and two covariates
##D   # The first row of the text file contains the column names y, cov1, and cov2. 
##D   complete.name <- system.file('extdata', 'pheno.txt', package='Eagle')
##D   
##D   pheno_obj <- ReadPheno(filename=complete.name)
##D            
##D 
##D  #  Suppose we want to perform the AM analysis at a 5% false positive rate. 
##D  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##D  
##D   ans <- FPR4AM(falseposrate = 0.05,
##D                 trait = 'y',
##D                 fformula=c('cov1+cov2'),
##D                 map = map_obj,
##D                 pheno = pheno_obj,
##D                 geno = geno_obj) 
##D  
##D 
##D   res <- AM(trait =  'y',
##D                 fformula=c('cov1+cov2'),
##D                 map = map_obj,
##D                 pheno = pheno_obj,
##D                 geno = geno_obj,
##D                 gamma = ans$setgamma)
##D 
##D 
## End(Not run)





