library(MPSEM)


### Name: TraitOUsimTree
### Title: Simulates the evolution of a quantitative trait.
### Aliases: ' trait-simulator ' ' EvolveOptimMarkovTree ' ' OUvar ' '
###   PEMvar ' ' TraitOUsimTree ' ' TraitVarGraphSim '

### ** Examples

opt <- c(-2,0,2) # Three trait optima: -2, 0, and 2
### Transition probabilities:
transit <- matrix(c(0.7,0.2,0.2,0.2,0.7,0.1,0.1,0.1,0.7),
                  length(opt),length(opt),dimnames=list(from=opt,to=opt))

# In this example, the trait has a probability of 0.7 to stay at a given
# optimum, a probability of 0.2 for the optimum to change from -2 to 0,
# from 0 to -2, and from 2 to -2, and a probability of 0.1 for the
# optimum to change from -2 to 2, from 0 to 2, and from 2 to 0.
nsp <- 25  # A random tree for 25 species.
tree2 <- rtree(nsp,tip.label=paste("Species",1:nsp,sep=""))
tree2$node.label=paste("N",1:tree2$Nnode,sep="")  # Node labels.

## Simulate 10 trials of optimum change.
reg <- EvolveOptimMarkovTree(tp=tree2,tw=transit,p=10,anc=2)
y1 <- TraitOUsimTree(tp=tree2,a=0,sigma=1,
                     opt=opt[reg[,1]],p=10)    # Neutral
y2 <- TraitOUsimTree(tp=tree2,a=1,sigma=1,
                     opt=opt[reg[,1]],p=10)    # Few selection.
y3 <- TraitOUsimTree(tp=tree2,a=10,sigma=1,
                     opt=opt[reg[,1]],p=10)    # Strong selection.

### Display optimum change with colours.
displayOUprocess <- function(tp,trait,regime,mvalue) {
  layout(matrix(1:2,1,2))
  n <- length(tp$tip.label)
ape::plot.phylo(tp,show.tip.label=TRUE,show.node.label=TRUE,root.edge=FALSE,
                direction="rightwards",adj=0,
                edge.color=rainbow(length(trait))[regime[tp$edge[,2]]])
  plot(y=1:n,x=mvalue[1:n],type="b",xlim=c(-5,5),ylab="",xlab="Trait value",yaxt="n",
       bg=rainbow(length(trait))[regime[1:n]],pch=21) 
  text(trait[regime[1:n]],y=1:n,x=5,col=rainbow(length(trait))[regime[1:n]])
  abline(v=0)
}

displayOUprocess(tree2,opt,reg[,1],y1[,1])  # Trait evolve neutrally,
displayOUprocess(tree2,opt,reg[,1],y2[,1])  # under weak selection,
displayOUprocess(tree2,opt,reg[,1],y3[,1])  # under strong selection.

#
x <- Phylo2DirectedGraph(tree2)
y4 <- TraitVarGraphSim(x, variance = MPSEM::OUvar, p=10, a=5)
#
DisplayTreeEvol <- function(tp,mvalue) {
  layout(matrix(1:2,1,2))
  n <- length(tp$tip.label)
  ape::plot.phylo(tp,show.tip.label = TRUE, show.node.label = TRUE, root.edge = FALSE,
                  direction = "rightwards", adj = 0)
  plot(y=1:n,x=mvalue[1:n],type="b",xlim=c(-5,5),ylab="",xlab="Trait value",yaxt="n",pch=21)
  abline(v=0)
}
## Recursively displays the simulated traits.
for(i in 1:10) {
  DisplayTreeEvol(tree2,y4[i,])
  if(is.null(locator(1)))
    break                   # Stops recursive display on a mouse right-click.
}



