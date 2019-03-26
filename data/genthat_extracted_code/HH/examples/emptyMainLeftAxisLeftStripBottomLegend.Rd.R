library(HH)


### Name: emptyMainLeftAxisLeftStripBottomLegend
### Title: Remove main title, left axis tick labels, left strip, bottom
###   legend from plot and keep the vertical spacing allocated to those
###   items.
### Aliases: emptyMainLeftAxisLeftStripBottomLegend
### Keywords: hplot

### ** Examples

## This is a small example.
## See ?plot.likert for the complete example including motivation.
##
require(grid)
require(lattice)
require(latticeExtra)
require(HH)

data(ProfChal)

tmp <- data.matrix(ProfChal[,1:5])
rownames(tmp) <- ProfChal$Question
ProfChal.list <- split.data.frame(tmp, ProfChal$Subtable)

Empl <- ProfChal.list[[2]]

pct   <- likert(Empl, as.percent="noRightAxis", xlab="Percent")
pct
count <- likert(Empl, rightAxis=TRUE,
                xlab="Count", ylab.right="Row Count Totals",
                scales=list(x=list(at=c(0, 100, 200))))
count
countEmptied <- HH:::emptyMainLeftAxisLeftStripBottomLegend(count)
countEmptied

tmp <- update(resizePanels(c(pct, countEmptied, y.same=TRUE, layout=c(2,1)), w=c(.8, .2)),
              scales=list(y=list(alternating=3, limits=count$y.limits),
                          x=list(at=list(pct$x.scales$at, count$x.scales$at),
                                 labels=list(pct$x.scales$labels,
                                             count$x.scales$labels))),
              xlab=c(" ", pct$xlab, " ", count$xlab),
              between=list(x=1))
tmp



