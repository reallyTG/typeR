library(HyPhy)


### Name: rgenetree
### Title: Samples gene family trees that evolved on a species tree with
###   various conditions.
### Aliases: rgenetree

### ** Examples

##First we need a simple species tree
spec<-read.tree(text="((A:0.5,B:0.5):0.5,C:1);")
##Now we sample ten gene trees starting with 3 reconstructed gene lineages
phy.all<-rgenetree(10,spec,0.5,0.5,3)
plot(phy.all)

##Now let's make sure that every tip has at least one gene and set an exponential prior on the root
phy.full<-rgenetree(10,spec,0.5,0.5,exp(-(1:20))/sum(exp(-(1:20))),NULL,TRUE)
plot(phy.full)

##Now lets force the whole gene tree to end in 10 genes and set a flat prior for the root
phy.10<-rgenetree(10,spec,0.5,0.5,NULL,10)
plot(phy.10)

##Now lets start with 3 genes, set the number of genes at each tip of spec and vary mu between the branches of spec 
phy.253<-rgenetree(10,spec,0.5,c(0,1,0.2,0.5),3,c(2,5,3))
plot(phy.253)



