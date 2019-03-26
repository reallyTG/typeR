library(LSD)


### Name: plotmatrix
### Title: Visualize two-dimensional data
### Aliases: LSD.plotmatrix plotmatrix
### Keywords: matrix

### ** Examples

len = 20
x = sin(seq(0,2*pi,length=len*2))
fun = function(){n=sample(1:len,1); return(x[n:(n+len-1)])}
input = t(replicate(7,fun(),simplify=TRUE))
input = input + rnorm(length(input))/2

plotmatrix(input,cols=1:7)



