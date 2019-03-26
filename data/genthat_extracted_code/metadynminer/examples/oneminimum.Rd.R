library(metadynminer)


### Name: oneminimum
### Title: Creates one ad hoc free energy minimum for a fes object
### Aliases: oneminimum

### ** Examples

tfes<-fes(acealanme1d)
minima<-fesminima(tfes)
minima<-minima+oneminimum(tfes, cv1=0, cv2=0)
minima



