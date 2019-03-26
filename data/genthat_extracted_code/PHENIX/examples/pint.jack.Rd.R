library(PHENIX)


### Name: pint.jack
### Title: Phenotypic integration (by Wagner) jackknife resampling
### Aliases: pint.jack

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grames) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
# 'TOTALSIZE'

data(tussilago)
pint.jack(tussilago[,1:5], 1) # Replicates are obtained removing one individual
pint.jack(tussilago[,1:5], 3) # Replicates are obtained removing three individuals



