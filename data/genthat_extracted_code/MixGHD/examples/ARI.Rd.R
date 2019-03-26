library(MixGHD)


### Name: ARI
### Title: Adjusted Rand Index.
### Aliases: ARI

### ** Examples

##loading banknote data
data(banknote)

##model estimation
res=MGHD(data=banknote[,2:7],  G=2   )

#result
ARI(res@map, banknote[,1])




