library(BAMMtools)


### Name: testTimeVariableBranches
### Title: Evaluate evidence for temporal rate variation across tree
### Aliases: testTimeVariableBranches

### ** Examples

# Load whale data:
data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.1, nsamples=200)

# compute the posterior probability of 
# time-varying rates on each branch
tree.pp <- testTimeVariableBranches(ed)

# Plot tree, but color all branches where the posterior 
# probability of time-varying rates exceeds 95%:

colvec <- rep("black", nrow(whales$edge))
colvec[tree.pp$edge.length >= 0.95] <- 'red'

plot.phylo(whales, edge.color=colvec, cex=0.5)

# now, compute Bayes factors for each branch:

tree.bf <- testTimeVariableBranches(ed, return.type = "bayesfactor")

# now, assume that our prior was heavily stacked in favor
# of a time-constant process:
tree.bf2 <- testTimeVariableBranches(ed, prior_tv = 0.1,
                                     return.type = "bayesfactor")

# Plotting the branch-specific Bayes factors against each other:

plot.new()
par(mar=c(5,5,1,1))
plot.window(xlim=c(0, 260), ylim=c(0, 260))
points(tree.bf2$edge.length, tree.bf$edge.length, pch=21, bg='red',
       cex=1.5)
axis(1)
axis(2, las=1)
mtext(side=1, text="Bayes factor: prior_tv = 0.1", line=3, cex=1.5)
mtext(side = 2, text = "Bayes factor: uniform prior odds", line=3,
      cex=1.5)

# and you can see that if your prior favors CONSTANT RATE dynamics
# you will obtain much stronger Bayes factor support for time varying
# rates.
# IF the evidence is present in your data to support time variation.
# To be clear, the Bayes factors in this example were computed from the
#  same posterior probabilities: it is only the prior odds that differed.



