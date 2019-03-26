library(compositions)


### Name: lrvgram
### Title: vgram2lrvgram
### Aliases: vgram2lrvgram cgram2vgram
### Keywords: multivariate

### ** Examples

data(juraset)
comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
vg <- CompLinModCoReg(~nugget()+sph(0.5)+R1*exp(0.7),comp)
vg(1:3)
vgram2lrvgram(vg)(1:3)



