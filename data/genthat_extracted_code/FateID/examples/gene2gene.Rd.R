library(FateID)


### Name: gene2gene
### Title: Comparative plot of the expression levels of two genes
### Aliases: gene2gene

### ** Examples

x <- intestine$x
y <- intestine$y
v <- intestine$v

tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
gene2gene(v,y,"Muc2__chr7","Apoa1__chr9")
gene2gene(v,y,"Muc2__chr7","Apoa1__chr9",fb=fb,tn="t6",plotnum=FALSE)




