library(ggm)


### Name: MarkEqRcg
### Title: Markov equivalence for regression chain graphs.
### Aliases: MarkEqRcg
### Keywords: graphs bidirected graph directed acyclic graph Markov
###   equivalence regression chain graph undirected graph multivariate

### ** Examples

H1<-matrix(c(0,100,0,0,0,100,0,100,0,0,0,100,0,0,0,1,0,0,0,100,0,0,1,100,0),5,5)
H2<-matrix(c(0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,100,0,0,1,100,0),5,5)
H3<-matrix(c(0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0),5,5)
#MarkEqRcg(H1,H2)
#MarkEqRcg(H1,H3)
#MarkEqRcg(H2,H3)



