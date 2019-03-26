library(TeachingDemos)


### Name: triplot
### Title: Create or add to a Trilinear Plot
### Aliases: triplot
### Keywords: hplot aplot

### ** Examples

triplot(USArrests[c(1,4,2)])
tmp <- triplot(USArrests[c(1,4,2)],txt=NULL)
if(interactive()){ identify(tmp, lab=rownames(USArrests) ) }

tmp <- rbind( HairEyeColor[,,'Male'], HairEyeColor[,,'Female'])
tmp[,3] <- tmp[,3] + tmp[,4]
tmp <- tmp[,1:3]
triplot(tmp, legend=rep(c('Male','Femal'),each=4),
 col=rep(c('black','brown','red','yellow'),2))



