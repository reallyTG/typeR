library(rdi)


### Name: rdiAxis
### Title: RDI Axis annotation function
### Aliases: rdiAxis

### ** Examples


#create genes
genes = sample(letters, 10000, replace=TRUE)
#create sequence annotations
seqAnnot = data.frame(donor = sample(1:10, 10000, replace=TRUE))
#calculate RDI
d = rdi(genes, seqAnnot)

##create a "baseVect" with the same probability as our features
##since we sampled uniformly, the base vector has equal probability
baseVect = rep(1/length(letters),length(letters))

##generate an RDI model
m = rdiModel(attr(d, "nseq"), baseVects=baseVect)

##convert RDI to lfc
td = convertRDI(d,models=m)$pred

par(mar=c(4,4,1,4),las=1,mgp=c(3,0.5,0))
plot(td,d, ylab="RDI", xlab="LFC")

##now add "true difference" axis annotation to the right side of the plot
rdiAxis(m, side=4)




