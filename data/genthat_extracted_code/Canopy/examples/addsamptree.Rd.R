library(Canopy)


### Name: addsamptree
### Title: To determine whether the sampled tree will be accepted
### Aliases: addsamptree
### Keywords: package

### ** Examples

data(MDA231)
data(MDA231_tree)
sna.name = MDA231$sna.name
Y = MDA231$Y
C = MDA231$C
R = MDA231$R
X = MDA231$X
WM = MDA231$WM
Wm = MDA231$Wm
epsilonM = MDA231$epsilonM
epsilonm = MDA231$epsilonm
# sampling location of SNAs
tree.new = MDA231_tree
tree.new$sna = sampsna(MDA231_tree)
tree.new$Z = getZ(tree.new, sna.name)
tree.new$Q = getQ(tree.new, Y, C)
tree.new$H = tree.new$Q
tree.new$VAF = getVAF(tree.new, Y)
tree.new$likelihood = getlikelihood(tree.new, R, X, WM, Wm, epsilonM, epsilonm)
tree = addsamptree(MDA231_tree,tree.new)



