library(forestSAS)


### Name: forestSAS-package
### Title: Forest Spatial Structure Analysis Systems
### Aliases: forestSAS-package forestSAS

### ** Examples

data(tree.ppp)
##Get the tree attributies of nearest neighbour
nnindices<-nnIndex(tree.ppp,N=4,
            smark=c("sp.code","dbh.cm","storey",
               "crownwid.m","group","biomass.kg",
               "quality","x","y"),buffer=FALSE)

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
Q<-fsasN4(nnindices$nnquality,match.fun=ideal,
          para=c("Excellent","Good"))
Q
#Tree corwding degree
C<-fsasN4(nnoverlap(nnindices$nncrownwid.m,
         nnindices$nndist),match.fun=crowding)
C
#Tree uniform angle index
W<-fsasN4(nnangle(nnindices$nndist,nnindices$nnx,
           nnindices$nny)$nnangle,
          match.fun=uniform.angle,para=72)
W
#Tree dominance
U<-fsasN4(nnindices$nndbh.cm,match.fun=dominance)
U
#Tree biomass dominance
B<-fsasN4(nnindices$nnbiomass.kg,match.fun=dominance)
B

##Compute the structrue heterogeneity of index
M.pv<-pv(M$result$index,optm=1)
M.pv
H.pv<-pv(H$result$index,optm=1)
H.pv
S.pv<-pv(S$result$index,optm=1)
S.pv
Q.pv<-pv(Q$result$index,optm=1)
Q.pv
C.pv<-pv(C$result$index,optm=0.5)
C.pv
W.pv<-pv(W$result$index,optm=0.5)
W.pv
U.pv<-pv(U$result$index,optm=0)
U.pv
B.pv<-pv(B$result$index,optm=0)
B.pv

##Compute total forest saptial structrue heterogeneity
#based on the average of indices preference value
IAVE<-pv(index=c(M$meanI,H$meanI,S$meanI,Q$meanI,
                       C$meanI,W$meanI,U$meanI,B$meanI),
               optm=c(1,1,1,1,0.5,0.5,0,0))
IAVE

##Compute total forest saptial structrue heterogeneity
#based on the preference value of indices average
IPVE=mean(M.pv,H.pv,S.pv,Q.pv,C.pv,W.pv,U.pv,B.pv)
IPVE



