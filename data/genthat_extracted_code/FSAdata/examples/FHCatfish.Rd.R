library(FSAdata)


### Name: FHCatfish
### Title: Catch-at-age of Flathead Catfish from three southeastern rivers.
### Aliases: FHCatfish
### Keywords: datasets

### ** Examples

data(FHCatfish)
str(FHCatfish)
head(FHCatfish)
op <- par(mfrow=c(2,2),pch=19)
plot(log(abundance)~age,data=FHCatfish,subset=river=="Coosa",main="Coosa")
plot(log(abundance)~age,data=FHCatfish,subset=river=="Ocmulgee",main="Ocmulgee")
plot(log(abundance)~age,data=FHCatfish,subset=river=="Satilla",main="Satilla")
par(op)




