library(flip)


### Name: flip-package
### Title: flip-package
### Aliases: flip-package flip.package flippackage
### Keywords: package

### ** Examples


Y=data.frame(matrix(rnorm(50),10,5))
names(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2]
x=rep(0:1,5)
data=data.frame(x=x, Z=rnorm(10))
res = flip(Y+matrix(x*2,10,5),~x,~Z,data=data)
res

plot(res)

p2=npc(res,"fisher",subsets=list(c1=c("A","B"),c2=names(Y)))
p2




