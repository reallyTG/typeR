library(ggm)


### Name: MarkEqMag
### Title: Markov equivalence of maximal ancestral graphs
### Aliases: MarkEqMag
### Keywords: graphs Markov equivalence maximal ancestral graphs
###   multivariate

### ** Examples

H1<-matrix(  c(0,100,  0,  0,
	         100,  0,100,  0,
               0,100,  0,100,
               0,  1,100,  0), 4, 4)
H2<-matrix(c(0,0,0,0,1,0,100,0,0,100,0,100,0,1,100,0),4,4)
H3<-matrix(c(0,0,0,0,1,0,0,0,0,1,0,100,0,1,100,0),4,4)
MarkEqMag(H1,H2)
MarkEqMag(H1,H3)
MarkEqMag(H2,H3)



