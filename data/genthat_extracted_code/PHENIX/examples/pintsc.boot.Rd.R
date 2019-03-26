library(PHENIX)


### Name: pintsc.boot
### Title: size-controlled phenotypic integration bootstrap intervals
### Aliases: pintsc.boot

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grams) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
# 'TOTALSIZE'

data(tussilago)

# Iit is mandatory to define the "control" variable. Otherwise, it gives an error:
# pintsc.boot(tussilago, 5000)
pintsc.boot(traits=tussilago[,1:5], replicates=100, control=tussilago[,6])
# The phenotypic integration index intervals do not include 0.
# For faster execution, we used 100 replicates in this example.
# For real data set increase this number:
# pintsc.boot(traits=tussilago[,1:5], replicates=5000, control=tussilago[,6])



