library(rdi)


### Name: rdiModel
### Title: RDI Models
### Aliases: rdiModel

### ** Examples

#create genes
genes = sample(letters, 10000, replace=TRUE)
#create sequence annotations
seqAnnot = data.frame(donor = sample(1:4, 10000, replace=TRUE))
#calculate RDI
d = rdi(genes, seqAnnot)

##create a "baseVect" with the same probability as our features
##since we sampled uniformly, the base vector has equal probability
baseVect = rep(1/length(letters),length(letters))

##generate an RDI model
m = rdiModel(attr(d, "nseq"), baseVects=baseVect)

##plot the spline model
plot(m$fit, xlab="log fold change",ylab="RDI",type='l')

##convert RDI to log fold change
mean = predict(m$rev.fit, d)$y
mean[mean<0] = 0




