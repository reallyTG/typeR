library(PHENIX)


### Name: pint
### Title: Phenotypic integration index by Wagner
### Aliases: pint

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grams) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
# 'TOTALSIZE'

data(tussilago)
pint (tussilago[,1:5]) # the last column is not included since represents the total size
# NOTE that the number of observations used by the function was 18 instead 29 that were
# included in the 'tussilago' data set. Missing values were removed. 



