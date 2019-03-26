library(multifluo)


### Name: multifluo-package
### Title: Dealing with Several Images of a Same Object Constituted of
###   Different Zones
### Aliases: multifluo-package multifluo
### Keywords: package

### ** Examples

data(count)
count.img=plotimage(mat=count,lim=c(0,5000))
data(df.scaled)
resPCA=pca(data=df.scaled[,-1], zone="zone",pixel="pixel")
couleurs=find.colors(rownames(resPCA$IndivCoord)) 
## No test: 
plotpca(resPCA)
## End(No test)




