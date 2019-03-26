library(biogeo)


### Name: parsecoords
### Title: Parse coordinates into separate fields
### Aliases: parsecoords

### ** Examples

fmtstr<-c("dd mm.m","dd mm ss.ss","dd mm ss") 
uf<-uniqueformats(places$long[1:3])
px<-parsecoords(places$long[1:3],uf,fmtstr) 



