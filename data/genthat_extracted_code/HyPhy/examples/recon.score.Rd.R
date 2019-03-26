library(HyPhy)


### Name: recon.score
### Title: Duplications and losses for gene tree in a species tree
### Aliases: recon.score

### ** Examples

##First we need a simple species tree
spec<-read.tree(text="((A:0.5,B:0.5):0.5,C:1);")
##Now let's simulate a bunch of gene family trees
genes<-rgenetree(10,spec,0.5,0.5,3,10,TRUE)
##Let's look at those trees
##Note that all their tips are labeled A, B or C, just like spec
plot(genes)
##Therefore we can calculate the counts for all trees without any other info
recon.score(spec,genes)
##On the other hand, if we make our own gene tree with different labels 
gene<-read.tree(text="((A1,(A2,B1)),(B2,(C1,C2)));")
##We must generate a reconcile vector
##to do so we must know the positions of the tip labels in both phylogenies
spec$tip.label
gene$tip.label
reconcile<-c(1,1,2,2,3,3)
recon.score(spec,gene,reconcile)
##To force the node at the base of A2 and B1 down to the branch below A and B
##we must look at both edge matrices to learn how each node and branch are labeled
spec$edge
gene$edge
reconcile<-c(1,1,2,2,3,3,NA,NA,-1,NA,NA)
recon.score(spec,gene,reconcile)



