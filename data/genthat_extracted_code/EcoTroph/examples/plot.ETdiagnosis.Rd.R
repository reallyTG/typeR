library(EcoTroph)


### Name: plot.ETdiagnosis
### Title: Plot Diagnosis Function
### Aliases: plot.ETdiagnosis
### Keywords: ~EcoTroph ~Diagnosis

### ** Examples

data(ecopath_guinee)
diagn.list<-create.ETdiagnosis(create.ETmain(ecopath_guinee),same.mE=TRUE)
plot(diagn.list)




