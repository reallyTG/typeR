library(PHENIX)


### Name: cor.par
### Title: Partial correlation
### Aliases: cor.par

### ** Examples

# Dataset from Torices & Méndez (2014)
# This data set represents the dry mass (in grams) of inflorescence components of the sunflower
# species Tussilago farfara. The inflorescences were dissected in 'SCAPE', 'RECEPTACLE', 'MALEFL'
# (male flowers), 'OVAR' (reproductive part of female flowers), and 'RAYS' (the petaloid ray of
# female flower). Furthermore in the last column the total weight of the inflorescence is added
# 'TOTALSIZE'

data(tussilago)
print(tussilago)
cor.par(tussilago[,1:5], tussilago[,6], trait.names=TRUE) # NA automatically removed

traits<-na.exclude(tussilago) # NA manually removed
cor.par(traits[,1:5], traits[,6], trait.names=TRUE)



