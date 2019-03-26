library(LSD)


### Name: makemovie
### Title: Interpolate rows of a matrix to extend the number of cols
### Aliases: LSD.makemovie makemovie
### Keywords: matrix

### ** Examples

len = 10
x = sin(seq(0,2*pi,length=len*2))
fun = function(){n=sample(1:len,1);return(x[n:(n+len-1)])}
input = t(replicate(7,fun(),simplify=TRUE))
input = input + rnorm(length(input))/2
par(mfrow=c(1,2))
plotmatrix(input,main="original",cols=1:7,type="o")
mov = makemovie(input,timestep=0.2)
plotmatrix(mov,main="interpolated",cols=1:7,type="o")



