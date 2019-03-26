library(multiDimBio)


### Name: FSelect
### Title: A Function to perform step-wise discriminant analysis using F
###   statistics
### Aliases: FSelect

### ** Examples

data(Nuclei)
data(Groups)
npcs<-floor(ncol(Nuclei)/5)

dat.comp <- completeData(data = Nuclei, n_pcs = npcs) 
groups.use <- c(1,2) 
use.dat <- which(Groups==groups.use[1]|Groups==groups.use[2])

dat.use <- Nuclei[use.dat,]
GR.use <- Groups[use.dat]

#not run
#FSelect(DAT.use,GR.use,3)



