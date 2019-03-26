library(bayou)


### Name: dsb
### Title: Probability density functions for bayou
### Aliases: dsb rsb

### ** Examples

n=10
tree <- sim.bdtree(n=n)
tree <- reorder(tree, "postorder")
nbranch <- 2*n-2
sb <- c(1,2, 2, 3)

# Allow any number of shifts on each branch, with probability 
# proportional to branch length
dsb(sb, ntips=n, bmax=Inf, prob=tree$edge.length)

# Disallow shifts on the first branch, returns -Inf because sb[1] = 1
dsb(sb, ntips=n, bmax=c(0, rep(1, nbranch-1)), prob=tree$edge.length)

# Set maximum number of shifts to 1, returns -Inf because two shifts 
# are on branch 2
dsb(sb, ntips=n, bmax=1, prob=1)

# Generate a random set of k branches
rsb(5, ntips=n, bmax=Inf, prob=tree$edge.length)



