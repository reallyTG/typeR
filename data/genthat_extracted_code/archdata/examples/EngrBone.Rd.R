library(archdata)


### Name: EngrBone
### Title: Upper Paleolithic Engraved Bone Design Elements - Spain
### Aliases: EngrBone
### Keywords: datasets

### ** Examples

data(EngrBone)
# Number of engraved bone specimens at each site
NS <- colSums(EngrBone)
# Number of kinds of engraved bone at each site
NT <- colSums(EngrBone>0)
plot(NS, NT, xlab="Number of Specimens", ylab="Number of Types", main="Engraved Bone", las=1)
text(NS, NT, names(EngrBone), pos=c(1, 3, 3, 3, 3))
Key <- apply(attr(EngrBone, "Variables"), 1, paste, collapse=" - ")
legend("topleft", legend=Key)



