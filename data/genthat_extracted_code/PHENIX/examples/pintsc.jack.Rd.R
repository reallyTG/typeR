library(PHENIX)


### Name: pintsc.jack
### Title: size-controlled phenotypic integration jackknife resampling
### Aliases: pintsc.jack

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grams) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
# 'TOTALSIZE'

data(tussilago)

# Iit is mandatory to define the "control" variable. Otherwise, it gives an error:
# pintsc.jack(tussilago, 1)
pintsc.jack(traits=tussilago[,1:5], control=tussilago[,6], 1)



