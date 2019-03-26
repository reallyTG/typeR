library(dtw)


### Name: stepPattern
### Title: Step patterns for DTW
### Aliases: stepPattern is.stepPattern print.stepPattern t.stepPattern
###   plot.stepPattern symmetric1 symmetric2 asymmetric
###   rabinerJuangStepPattern symmetricP0 asymmetricP0 symmetricP05
###   asymmetricP05 symmetricP1 asymmetricP1 symmetricP2 asymmetricP2
###   typeIa typeIas typeIb typeIbs typeIc typeIcs typeId typeIds typeIIa
###   typeIIb typeIIc typeIId typeIIIc typeIVc mori2006 rigid
### Keywords: ts

### ** Examples


#########
##
## The usual (normalizable) symmetric step pattern
## Step pattern recursion, defined as:
## g[i,j] = min(
##      g[i,j-1] + d[i,j] ,
##      g[i-1,j-1] + 2 * d[i,j] ,
##      g[i-1,j] + d[i,j] ,
##   )

print(symmetric2)   # or just "symmetric2"



#########
##
## The well-known plotting style for step patterns

plot(symmetricP2,main="Sakoe's Symmetric P=2 recursion")



#########
##
## Same example seen in ?dtw , now with asymmetric step pattern

idx<-seq(0,6.28,len=100);
query<-sin(idx)+runif(100)/10;
reference<-cos(idx);

## Do the computation 
asy<-dtw(query,reference,keep=TRUE,step=asymmetric);

dtwPlot(asy,type="density",main="Sine and cosine, asymmetric step")


#########
##
##  Hand-checkable example given in [Myers1980] p 61
##

`tm` <-
structure(c(1, 3, 4, 4, 5, 2, 2, 3, 3, 4, 3, 1, 1, 1, 3, 4, 2,
3, 3, 2, 5, 3, 4, 4, 1), .Dim = c(5L, 5L))






