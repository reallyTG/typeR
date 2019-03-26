library(diversitree)


### Name: trait.plot
### Title: Plot a Phylogeny and Traits
### Aliases: trait.plot
### Keywords: hplot

### ** Examples

## These are the parameters: they are a single speciation and extinction
## rate, then 0->1 (trait A), 1->0 (A), 0->1 (B) and 1->0 (B).
colnames(musse.multitrait.translate(2, depth=0))

## Simulate a tree where trait A changes slowly and B changes rapidly.
set.seed(1)
phy <- tree.musse.multitrait(c(.1, 0, .01, .01, .05, .05),
                             n.trait=2, depth=0, max.taxa=100,
                             x0=c(0,0))
## Here is the matrix of tip states (each row is a species, each column
## is a trait).
head(phy$tip.state)

trait.plot(phy, phy$tip.state,
           cols=list(A=c("pink", "red"), B=c("lightblue", "blue")))

nodes <- c("nd5", "nd4", "nd7", "nd11", "nd10", "nd8")
grp <- lapply(nodes, get.descendants, phy, tips.only=TRUE)
class <- rep(NA, 100)
for ( i in seq_along(grp) )
  class[grp[[i]]] <- paste("group", LETTERS[i])

## Now, 'class' is a vector along phy$tip.label indicating which of six
## groups each species belongs.

## Plotting the phylogeny with these groups:
trait.plot(phy, phy$tip.state,
           cols=list(A=c("pink", "red"), B=c("lightblue", "blue")),
           class=class, font=1, cex.lab=1, cex.legend=1)

## Add another state, showing values 1:3, names, and trait ordering.
tmp <- sim.character(phy, c(-.1, .05, .05, .05, -.1, .05, .05, 0.05, -.1), 
                     model="mkn", x0=1)
phy$tip.state <- data.frame(phy$tip.state, C=tmp)
trait.plot(phy, phy$tip.state,
           cols=list(C=c("palegreen", "green3", "darkgreen"),
                     A=c("pink", "red"), B=c("lightblue", "blue")),
           lab=c("Animal", "Vegetable", "Mineral"),
           str=list(c("crane", "toad", "snail"), c("kale", "carrot"), 
                    c("calcite", "beryl")))

## Rectangular/phylogram plot with groups.
trait.plot(ladderize(phy, right=FALSE), phy$tip.state, type="p",
           cols=list(A=c("pink", "red"), B=c("lightblue", "blue"),
                     C=c("palegreen", "green3", "darkgreen")),
           class=class, font=1, cex.lab=1)



