library(multifluo)


### Name: reshapimg
### Title: Reshape image matrices as one sigle dataframe (useful to pca,
###   for example)
### Aliases: reshapimg

### ** Examples

data(count)
data(newgp)
data(lifetime)
data(zone.img)

df37A=reshapimg(zone.img,list(count,lifetime,newgp),name.img=c("Count","Lifetime","GP"))



