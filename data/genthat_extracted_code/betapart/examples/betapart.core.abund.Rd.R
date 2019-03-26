library(betapart)


### Name: betapart.core.abund
### Title: Core calculations of betapart for abundance-based dissimilarity
###   measures
### Aliases: betapart.core.abund

### ** Examples

require(vegan)
data(BCI)
core.BCI<-betapart.core.abund(BCI)
pair.BCI<-beta.pair.abund(core.BCI)
multi.BCI<-beta.multi.abund(core.BCI)



