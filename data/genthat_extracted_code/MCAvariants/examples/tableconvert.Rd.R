library(MCAvariants)


### Name: tableconvert
### Title: Convert contingency table in table of reduced code
### Aliases: tableconvert
### Keywords: multivariate

### ** Examples

alligatormca<-tableconvert(alligator.dat)
dimnames(alligatormca)<-list(paste("a", 1:300,sep = ""),c("Size","Food","Lake"))



