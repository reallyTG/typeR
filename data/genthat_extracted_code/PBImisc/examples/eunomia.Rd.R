library(PBImisc)


### Name: eunomia
### Title: European Evaluation of Coercion in Psychiatry and Harmonisation
###   of Best Clinical Practise
### Aliases: eunomia
### Keywords: eunomia

### ** Examples

data(eunomia)
library(lattice)
bwplot(CENTRE13~BPRS.T1, data=eunomia)
xyplot(BPRS.T1~MANSA.T1|CENTRE13, data=eunomia, type=c("p","g","smooth"))



