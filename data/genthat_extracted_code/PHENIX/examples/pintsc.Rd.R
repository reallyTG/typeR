library(PHENIX)


### Name: pintsc
### Title: size-controlled phenotypic integration
### Aliases: pintsc

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grams) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
#'TOTALSIZE'

data(tussilago)

# To estimate the PINT indices controlling by a third variable
# it is mandatory to define the "control" variable. Otherwise, it gives an error:
#
# pintsc(traits=tussilago)
pintsc(traits=tussilago[,1:5],control=tussilago[,6])



