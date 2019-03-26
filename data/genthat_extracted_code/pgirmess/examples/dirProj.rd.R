library(pgirmess)


### Name: dirProj
### Title: Computes new coordinates given bearings and distances.
### Aliases: dirProj
### Keywords: spatial

### ** Examples


df<-data.frame(x1=0,y1=0,alpha=runif(3,0,360),d=runif(3,0,1))
df
plot(-1:1,-1:1,type="n")
points(0,0,pch=19)
points(dirProj(df))
text(dirProj(df)[,1],dirProj(df)[,2],1:3,pos=4)



