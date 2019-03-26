library(adlift)


### Name: findadds
### Title: Finds minimum number of inversion steps
### Aliases: findadds
### Keywords: methods

### ** Examples

#create data:
x<-runif(256)

f<-make.signal2("bumps",x=x)

#do forward transform:
fwd<-fwtnp(x,f)

#I want to invert enough so that points 1:3 are reconstructed.

adds<-findadds(fwd$removelist,fwd$neighbrs,fwd$pointsin,1:3)
adds

#now reconstruct...
fhat<-invtnp(fwd,f,nadd=max(adds))

#...and check that the desired points are the same:
f[1:3]
fhat[1:3]




