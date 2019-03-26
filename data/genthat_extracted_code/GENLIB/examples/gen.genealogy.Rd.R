library(GENLIB)


### Name: gen.genealogy
### Title: Create object of class GLgen
### Aliases: gen.genealogy
### Keywords: manip

### ** Examples

ind<-c(1,2,3,11:21,101:108,201:202)
father<-c(11,15,15,102,0,102,0,103,103,103,105,105,107,107,0,202,0,202,202,0,202,0,0,0)
mother<-c(12,14,14,101,0,101,0,104,104,104,106,106,108,108,0,201,0,201,201,0,201,0,0,0)
sex<-c(1,2,2,1,2,1,2,1,2,1,2,2,2,1,2,1,1,2,1,2,1,2,2,1)
gen.df<-data.frame(ind, father, mother, sex)  
gen.genealogy(gen.df)

data(geneaJi) 
geneaJi[1:5,]
genJi<-gen.genealogy(geneaJi)
## Not run: Print basic information about the genealogy
genJi



