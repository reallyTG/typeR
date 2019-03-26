library(KODAMA)


### Name: lymphoma
### Title: Lymphoma Gene Expression Dataset
### Aliases: lymphoma
### Keywords: datasets

### ** Examples

data(lymphoma)
class=1+as.numeric(lymphoma$class)
cc=prcomp(lymphoma$data)$x
plot(cc,pch=21,bg=class,xlab="First Component",ylab="Second Component")

#
# kk=KODAMA(lymphoma$data)
# plot(kk$pp,pch=21,bg=class,xlab="First Component",ylab="Second Component")
#



