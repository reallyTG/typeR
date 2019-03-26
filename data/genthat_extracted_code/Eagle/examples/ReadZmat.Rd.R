library(Eagle)


### Name: ReadZmat
### Title: Read Z matrix
### Aliases: ReadZmat

### ** Examples

# Read in  example Z matrix from ./extdata/

# find the full location of the Z matrix data 
complete.name <- system.file('extdata', 'Z.txt', package='Eagle')
  
# read in Z matrix data 
Z_obj <- ReadZmat(filename=complete.name) 
                               
# look at first few rows of the Z matrix file
head(Z_obj)





