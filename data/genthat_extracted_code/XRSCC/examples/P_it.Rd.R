library(XRSCC)


### Name: P_it
### Title: Iteration of p control chart for attributes
### Aliases: P_it P_chart
### Keywords: defectives attributes fraction

### ** Examples

data(bottles)
r1<-p_gr(bottles, n=100)
r2<-P_it(r1)
r3<-P_it(r2)



