library(multiDimBio)


### Name: completeData
### Title: Function to impute missing data.
### Aliases: completeData

### ** Examples

data(Nuclei)
npcs<-floor(ncol(Nuclei)/5)

length(which(is.na(Nuclei))==TRUE)

dat.comp<-completeData(data = Nuclei, n_pcs = npcs)

length(which(is.na(dat.comp))==TRUE)



