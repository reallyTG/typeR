library(flip)


### Name: flip.object-class
### Title: Class flip.object
### Aliases: flip.object-class show,flip.object-method summary
###   summary,flip.object-method summary,flip.object-method
###   dim,flip.object-method [,flip.object,ANY,ANY,ANY-method
###   [,flip.object-method [[ [[,flip.object-method length
###   length,flip.object-method names,flip.object-method
###   names<-,flip.object-method sort,flip.object-method
###   hist,flip.object-method plot,flip.object-method

### ** Examples

Y=matrix(rnorm(50),10,5)
colnames(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2] +2
res = flip(Y)
res
summary(res)
sort(res)
names(res)
length(res)
dim(res)
res=res[2:3]
res
hist(res)
plot(res)



