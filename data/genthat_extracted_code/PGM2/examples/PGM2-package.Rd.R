library(PGM2)


### Name: PGM2-package
### Title: Nested Resolvable Designs and their Associated Uniform Designs
### Aliases: PGM2 PGM2-package

### ** Examples


m<-4
X<-BIB(m)
n<-1
mat<-X$BIB
Y<-Resolvable(n,mat)   #Extract the RBIB
n<-1
mat<-X$BIB
X2<-Gen(n,mat)  #Extract the BIBD of the second generation
## Not run: 
##D #Algorithm of the 3rd example in the paper : (Abla Boudraa & al) IJRRAS.
##D #(17), Issue 2 (2013).
##D 
##D bib<-BIB(3)$BIB
##D mat<-NULL
##D for(i in 1:15){mat[[i]]<-Gen(i,bib)$BIB2}
##D x<-Reduce("rbind",mat)
##D e<-dim(x)[1]
##D b<-dim(x)[2]
##D v<-bib[1,]
##D for (i in 1:e) {for (j in 1:b) {if (any (x[i,j]==v)) {x[i,j]<-0}}}
##D for (i in e:1) { if (all (x[i,]==0)) {x<-x[-i,]}}
##D s<-x[1,]
##D s<-s[s>0]
##D h<-length(s)
##D f<-dim(x)[1]
##D x1<-matrix(nrow=f, ncol=h)
##D for (i in 1:f) {x1[i,]<-x[i,][x[i,]>0]}
##D A<-unique(x1)
##D UD<-Uniform(A)
## End(Not run)



