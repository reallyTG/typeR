library(qtlmt)


### Name: sureStep
### Title: SURE model selection
### Aliases: sureAdd1 sureDrop1 sureStep surStep

### ** Examples

data(etrait)
x<- as.matrix(mdat-1/2)
y<- as.matrix(traits)[,1:3]
v<- list()
upper<- list()
for(k in 1:ncol(y)){
   v[[k]]<- numeric(0)
   upper[[k]]<- 1:ncol(x)
}
## Not run: 
##D o1<- surStep(y, x, v=v, upper=upper, k=19)
##D o2<- sureStep(o1, y, x, cv=50, ext=FALSE)
##D 
##D # search for optimal model of o1
##D o3<- sureStep(o1, y, x, cv=Inf, direction="forward", ext=TRUE)
## End(Not run)



