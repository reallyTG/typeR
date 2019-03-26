library(forestSAS)


### Name: fsasN4
### Title: A body function to analyze the forest saptial structure.
### Aliases: fsasN4

### ** Examples

data(tree.ppp)
##Get the tree attributies of nearest neighbour for calculation
nnindices<-nnIndex(tree.ppp,N=4,
                  smark=c("sp.code","dbh.cm","storey","crownwid.m","group",
                           "biomass.kg","quality","x","y"),buffer=FALSE)

#Species mingling
M<-fsasN4(nnindices$nnsp.code,match.fun=mingling)
M
#Stand storey differation degree
H<-fsasN4(nnindices$nnstorey,match.fun=differ)
H
#Tree successional degree
S<-fsasN4(nnindices$nngroup,match.fun=ideal,para="Climax")
S
#Tree quality ideal state
Q<-fsasN4(nnindices$nnquality,match.fun=ideal,para=c("Excellent","Good"))
Q
#Tree corwding degree
C<-fsasN4(nnoverlap(nnindices$nncrownwid.m,nnindices$nndist),match.fun=crowding)
C
#Tree uniform angle index
W<-fsasN4(nnangle(nnindices$nndist,nnindices$nnx,nnindices$nny)$nnangle,
          match.fun=uniform.angle,para=72)
W
#Tree dominance
U<-fsasN4(nnindices$nndbh.cm,match.fun=dominance)
U
#Tree biomass dominance
B<-fsasN4(nnindices$nnbiomass.kg,match.fun=dominance)
B



