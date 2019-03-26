library(treelet)


### Name: Run_JTree
### Title: Treelet basis/hierarchical tree construction
### Aliases: Run_JTree

### ** Examples

data(Ahat)
out=Run_JTree(Ahat,49,49)
#The information in out$Zpos[1,] and out$all_nodes[1,]
#both show which two individuals were the first merged 
#in the tree.  The remaining rows give information
#on subsequent merges in the tree.

basis=out$basis[[49]]
cov=out$TreeCovs[[49]]
temp=basis
#This is how you can use the basis and cov output
#to reconstruct the estimated relationship matrix.
#See how close temp and the original Ahat are:
Ahat1=round(Ahat,14)
temp1=round(temp,14)
sum(Ahat1!=temp1)
#In this example, we do start seeing discrepancies in the 15th digit and beyond.




