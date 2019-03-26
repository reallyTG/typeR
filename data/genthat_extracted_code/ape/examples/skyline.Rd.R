library(ape)


### Name: skyline
### Title: Skyline Plot Estimate of Effective Population Size
### Aliases: skyline skyline.phylo skyline.coalescentIntervals
###   skyline.collapsedIntervals find.skyline.epsilon
### Keywords: manip

### ** Examples

# get tree
data("hivtree.newick") # example tree in NH format
tree.hiv <- read.tree(text = hivtree.newick) # load tree

# corresponding coalescent intervals
ci <- coalescent.intervals(tree.hiv) # from tree

# collapsed intervals
cl1 <- collapsed.intervals(ci,0)
cl2 <- collapsed.intervals(ci,0.0119)

#### classic skyline plot ####
sk1 <- skyline(cl1)        # from collapsed intervals 
sk1 <- skyline(ci)         # from coalescent intervals
sk1 <- skyline(tree.hiv)   # from tree
sk1

plot(skyline(tree.hiv))
skylineplot(tree.hiv) # shortcut

plot(sk1, show.years=TRUE, subst.rate=0.0023, present.year = 1997)

#### generalized skyline plot ####

sk2 <- skyline(cl2)              # from collapsed intervals
sk2 <- skyline(ci, 0.0119)       # from coalescent intervals
sk2 <- skyline(tree.hiv, 0.0119) # from tree
sk2

plot(sk2)

# classic and generalized skyline plot together in one plot
plot(sk1, show.years=TRUE, subst.rate=0.0023, present.year = 1997, col=c(grey(.8),1))
lines(sk2,  show.years=TRUE, subst.rate=0.0023, present.year = 1997)
legend(.15,500, c("classic", "generalized"), col=c(grey(.8),1),lty=1)


# find optimal epsilon parameter using AICc criterion
find.skyline.epsilon(ci)

sk3 <- skyline(ci, -1) # negative epsilon also triggers estimation of epsilon
sk3$epsilon



