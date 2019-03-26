library(XRSCC)


### Name: NP_it
### Title: Iteration of np control chart for attributes
### Aliases: NP_it
### Keywords: defectives attributes

### ** Examples

data(bottles)
r1<-np_gr(bottles, n=100)
r2<-NP_it(r1)
r3<-NP_it(r2)



