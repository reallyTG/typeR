library(ggtern)


### Name: geom_errorbarX
### Title: Ternary Error Bars
### Aliases: geom_errorbarX geom_errorbarT geom_errorbarL geom_errorbarR
###   GeomErrorbart GeomErrorbarl GeomErrorbarr
### Keywords: datasets

### ** Examples

#Example with Dummy Data.
tmp <- data.frame(x=1/3,
y=1/3,
z=1/3,
Min=1/3-1/6,
Max=1/3+1/6)
ggtern(data=tmp,aes(x,y,z)) + 
  geom_point() + 
  geom_errorbarT(aes(Tmin=Min,Tmax=Max),colour='red')+
  geom_errorbarL(aes(Lmin=Min,Lmax=Max),colour='green')+
  geom_errorbarR(aes(Rmin=Min,Rmax=Max),colour='blue') 



