library(Eagle)


### Name: SummaryAM
### Title: Summary of multiple locus association mapping results
### Aliases: SummaryAM

### ** Examples

 ## Not run: 
##D   # Since the following code takes longer than 5 seconds to run, it has been tagged as dontrun. 
##D   # However, the code can be run by the user. 
##D   #
##D 
##D   #---------------
##D   # read the map 
##D   #---------------
##D   #
##D   # File is a plain space separated text file with the first row 
##D   # the column headings
##D   complete.name <- system.file('extdata', 'map.txt', 
##D                                    package='Eagle')
##D   map_obj <- ReadMap(filename=complete.name) 
##D 
##D  # to look at the first few rows of the map file
##D  head(map_obj)
##D 
##D   #------------------
##D   # read marker data
##D   #------------------
##D   # Reading in a PLINK ped file 
##D   # and setting the available memory on the machine for the reading of the data to 8 gigabytes
##D   complete.name <- system.file('extdata', 'geno.ped', 
##D                                      package='Eagle')
##D   geno_obj <- ReadMarker(filename=complete.name,  type='PLINK', availmemGb=8) 
##D  
##D   #----------------------
##D   # read phenotype data
##D   #-----------------------
##D 
##D   # Read in a plain text file with data on a single trait and two fixed effects
##D   # The first row of the text file contains the column names y, cov1, and cov2. 
##D   complete.name <- system.file('extdata', 'pheno.txt', package='Eagle')
##D   
##D   pheno_obj <- ReadPheno(filename=complete.name)
##D            
##D   #-------------------------------------------------------
##D   # Perform multiple-locus genome-wide association mapping 
##D   #-------------------------------------------------------                   
##D   res <- AM(trait = 'y',
##D                            fformula=c("cov1 + cov2"),
##D                            map = map_obj,
##D                            pheno = pheno_obj,
##D                            geno = geno_obj, availmemGb=8)
##D 
##D   #-----------------------------------------
##D   # Produce additional summary information 
##D   #------------------------------------------
##D 
##D   SummaryAM(AMobj=res, pheno=pheno_obj, geno=geno_obj, map=map_obj)
##D  
## End(Not run)






