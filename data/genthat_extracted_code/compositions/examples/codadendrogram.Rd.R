library(compositions)


### Name: CoDaDendrogram
### Title: Dendrogram representation of acomp or rcomp objects
### Aliases: CoDaDendrogram
### Keywords: hplot

### ** Examples

# first example: take the data set from the example, select only
# compositional parts
data(Hydrochem)
x = acomp(Hydrochem[,-c(1:5)])
gr = Hydrochem[,4] # river groups (useful afterwards)
# use an ilr basis coming from a clustering of parts
dd = dist(t(clr(x)))
hc1 = hclust(dd,method="ward")
plot(hc1)
mergetree=hc1$merge
CoDaDendrogram(X=acomp(x),mergetree=mergetree,col="red",range=c(-8,8),box.space=1)
# add the mean of each river
color=c("green3","red","blue","darkviolet")
aux = clrInv(t(sapply(split(clr(x),gr),mean)))
CoDaDendrogram(X=aux,add=TRUE,col=color,type="points",pch=4)

# second example: box-plots by rivers (filled)
CoDaDendrogram(X=acomp(x),mergetree=mergetree,col="black",range=c(-8,8),type="l")
xsplit = split(x,gr)
for(i in 1:4){
 CoDaDendrogram(X=acomp(xsplit[[i]]),col=color[i],type="box",box.pos=i-2.5,box.space=0.5,add=TRUE)
}

# third example: fewer parts, partition defined by a signary, and empty box-plots
x = acomp(Hydrochem[,c("Na","K","Mg","Ca","Sr","Ba","NH4")])
signary = t(matrix(  c(1,   1,   1,  1,   1,   1,  -1,
                       1,   1,  -1, -1,  -1,  -1,   0,
                       1,  -1,   0,  0,   0,   0,   0,
                       0,   0,  -1,  1,  -1,  -1,   0,
                       0,   0,   1,  0,  -1,   1,   0,
                       0,   0,   1,  0,   0,  -1,   0),ncol=7,nrow=6,byrow=TRUE))

CoDaDendrogram(X=acomp(x),signary=signary,col="black",range=c(-8,8),type="l")
xsplit = split(x,gr)
for(i in 1:4){
  CoDaDendrogram(X=acomp(xsplit[[i]]),border=color[i],
       type="box",box.pos=i-2.5,box.space=1.5,add=TRUE)
  CoDaDendrogram(X=acomp(xsplit[[i]]),col=color[i],
       type="line",add=TRUE)
}



