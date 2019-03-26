library(tsvr)


### Name: aggts
### Title: Aggregates a 'tsvreq_classic' object across a set of timescales;
###   also the constructor function for class 'vreq_classic_ag'.
### Aliases: aggts

### ** Examples

X<-matrix(runif(10*100),10,100)
h<-tsvreq_classic(X)
res1<-aggts(h,h$ts[h$ts>=4]) 
res2<-aggts(h,h$ts[h$ts>=4 | h$ts<=4/3]) 
#res1 and res2 produce the same result 
#because of Fourier symmetry around the 
#Nyquist timescale - see Details 




