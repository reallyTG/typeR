library(provenance)


### Name: plot.INDSCAL
### Title: Plot an INDSCAL group configuration and source weights
### Aliases: plot.INDSCAL

### ** Examples

data(Namib)
coast <- c('N1','N2','N3','N10','N11','N12','T8','T13')
snames <- names(Namib$DZ)
pch <- rep(21,length(snames))
pch[which(snames %in% coast)] <- 22
plot(indscal(Namib$DZ,Namib$HM),pch=pch)



