library(Eagle)


### Name: ReadMarker
### Title: Read marker data.
### Aliases: ReadMarker

### ** Examples

  #--------------------------------
  #  Example 1
  #-------------------------------
  #
  # Read in the genotype data contained in the text file geno.txt
  #
  # The function system.file() gives the full file name (name + full path).
  complete.name <- system.file('extdata', 'geno.txt', package='Eagle')
  # 
  # The full path and name of the file is
  print(complete.name)
  
  # Here, 0 values are being treated as genotype AA,
  # 1 values are being treated as genotype AB, 
  # and 2 values are being treated as genotype BB. 
  # 4 gigabytes of memory has been specified. 
  # The file is space separated with the rows the individuals
  # and the columns the snp loci.
  geno_obj <- ReadMarker(filename=complete.name, type='text', AA=0, AB=1, BB=2, availmemGb=4) 
   
  # view list contents of geno_obj
  print(geno_obj)

  #--------------------------------
  #  Example 2
  #-------------------------------
  #
  # Read in the allelic data contained in the PLINK ped file geno.ped
  #
  # The function system.file() gives the full file name (name + full path).
  complete.name <- system.file('extdata', 'geno.ped', package='Eagle')

  # 
  # The full path and name of the file is
  print(complete.name)
  
  # Here,  the first 6 columns are being ignored and the allelic 
  # information in columns 7 -  10002 is being converted into a reformatted file. 
  # 4 gigabytes of memory has been specified. 
  # The file is space separated with the rows the individuals
  # and the columns the snp loci.
  geno_obj <- ReadMarker(filename=complete.name, type='PLINK', availmemGb=4) 
   
  # view list contents of geno_obj
  print(geno_obj)





