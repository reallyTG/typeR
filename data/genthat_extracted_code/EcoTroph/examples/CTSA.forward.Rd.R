library(EcoTroph)


### Name: CTSA.forward
### Title: Catch Trophic Spectrum Analysis (CTSA) - Forward
### Aliases: CTSA.forward
### Keywords: ~EcoTroph ~CTSA

### ** Examples

data(ecopath_guinee)
catch.group=ecopath_guinee[,c("group_name","TL","catch.1","catch.2")]
Y_test <- CTSA.catch.input(catch.group)
B.TL1=create.ETmain(ecopath_guinee)$ET_Main$B[1]
results <- CTSA.forward(Y_test,Biomass.TL1=B.TL1,
	asymptote=.7,TL50=3,slope=5,temp=28,TE=10)
results



