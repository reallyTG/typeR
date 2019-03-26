library(psych)


### Name: polar
### Title: Convert Cartesian factor loadings into polar coordinates
### Aliases: polar
### Keywords: multivariate

### ** Examples


circ.data <- circ.sim(24,500)
circ.fa <- fa(circ.data,2)
circ.polar <- round(polar(circ.fa),2)
circ.polar
#compare to the graphic
cluster.plot(circ.fa)



