library(ape)


### Name: ltt.plot
### Title: Lineages Through Time Plot
### Aliases: ltt.plot ltt.lines mltt.plot ltt.coplot ltt.plot.coords
### Keywords: hplot aplot

### ** Examples

data(bird.families)
opar <- par(mfrow = c(2, 1))
ltt.plot(bird.families)
title("Lineages Through Time Plot of the Bird Families")
ltt.plot(bird.families, log = "y")
title(main = "Lineages Through Time Plot of the Bird Families",
      sub = "(with logarithmic transformation of the y-axis)")
par(opar)

### to plot the tree and the LTT plot together
data(bird.orders)
layout(matrix(1:4, 2, 2))
plot(bird.families, show.tip.label = FALSE)
ltt.plot(bird.families, main = "Bird families")
plot(bird.orders, show.tip.label = FALSE)
ltt.plot(bird.orders, main = "Bird orders")
layout(1)

### better with ltt.coplot():
ltt.coplot(bird.families, show.tip.label = FALSE, x.lim = 27.5)
data(chiroptera)
chiroptera <- compute.brlen(chiroptera)
ltt.coplot(chiroptera, show.tip.label = FALSE, type = "c")

### with extinct lineages and a root edge:
omar <- par("mar")
set.seed(31)
tr <- rlineage(0.2, 0.15)
tr$root.edge <- 5
ltt.coplot(tr, show.tip.label = FALSE, x.lim = 55)
## compare with:
## ltt.coplot(drop.fossil(tr), show.tip.label = FALSE)
layout(1)
par(mar = omar)

mltt.plot(bird.families, bird.orders)
### Generates 10 random trees with 23 tips:
TR <- replicate(10, rcoal(23), FALSE)
### Give names to each tree:
names(TR) <- paste("random tree", 1:10)
### And specify the class of the list so that mltt.plot()
### does not trash it!
class(TR) <- "multiPhylo"
mltt.plot(TR, bird.orders)
### And now for something (not so) completely different:
ltt.plot(bird.orders, lwd = 2)
for (i in 1:10) ltt.lines(TR[[i]], lty = 2)
legend(-20, 10, lwd = c(2, 1), lty = c(1, 2), bty = "n",
       legend = c("Bird orders", "Random (coalescent) trees"))



