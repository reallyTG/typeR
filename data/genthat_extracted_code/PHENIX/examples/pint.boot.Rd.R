library(PHENIX)


### Name: pint.boot
### Title: Phenotypic integration (by Wagner) bootstrap intervals
### Aliases: pint.boot

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grames) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
# 'TOTALSIZE'

data(tussilago)
pint.boot(tussilago[,1:5], 100)
# The phenotypic integration intervals do not include 0.
# For faster execution, we used 100 replicates in this example.
# For real data set increase this number:
# pint.boot(tussilago[,1:5], 5000)



