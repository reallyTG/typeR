library(SDMTools)


### Name: SigDiff
### Title: Identify Regions of Significant Differences
### Aliases: ImageDiff SigDiff

### ** Examples

#create some simple objects of class 'asc'
tasc = as.asc(matrix(1:50,nr=50,nc=50)); print(tasc)
#modify the asc objects so that they are slightly different
tasc1 = tasc + runif(n = 2500, min = -1, max = 1)
tasc2 = tasc + rnorm(n = 2500, mean = 1, sd = 1)

#create graphical representation
par(mfrow=c(2,2),mar=c(1,1,4,1))
image(tasc1,main='first grid',axes=FALSE)
image(tasc2,main='second grid',axes=FALSE)

#get significant difference by spatial patterning
out = SigDiff(tasc1,tasc2)
ImageDiff(out,main="Pattern Differences",axes=FALSE)

#get significant difference
out = SigDiff(tasc1,tasc2,pattern=FALSE)
ImageDiff(out,main="Absolute Differences",axes=FALSE)
legend('topleft',legend=c('-ve','ns','+ve'),title='significance',
  fill=terrain.colors(3),bg='white')



