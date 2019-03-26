library(ITNr)


### Name: ITNcorr
### Title: ITN Correlation Plot
### Aliases: ITNcorr

### ** Examples

require(igraph)

##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Plot correlation matrix between degree and strength scores.
corr_plot<-ITNcorr(ITN)




