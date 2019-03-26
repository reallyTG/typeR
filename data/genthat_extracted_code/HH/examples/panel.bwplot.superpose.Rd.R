library(HH)


### Name: panel.bwplot.superpose
### Title: Panel function for bwplot that displays an entire box in the
###   colors coded by groups.
### Aliases: panel.bwplot.superpose panel.bwplot.groups
### Keywords: dplot

### ** Examples

tmp <- data.frame(Response=rnorm(20), Group=factor(rep(LETTERS[1:3], c(5,7,8))))

bwplot(Group ~ Response, data=tmp,
       main="Default panel.bwplot, groups ignored", groups=Group)

bwplot(Group ~ Response, data=tmp,
       main="panel.bwplot.superpose",
       groups=Group, panel=panel.bwplot.superpose)

bwplot(Group ~ Response, data=tmp,
       main="panel.bwplot.superpose with fill specified",
       groups=Group, panel=panel.bwplot.superpose,
       fill.alpha=.33)


bwplot(Group ~ Response, data=tmp,
       main="panel.bwplot.superpose, with color specified",
       groups=Group, panel=panel.bwplot.superpose,
       col=c("forestgreen","blue", "brown"))


Test <- data.frame(id=rep(letters, each=4),
                   Week=rep(c(0,1,3,6), 26),
                   Treatment=rep(c("A","B"), each=52),
                   y=rep(1:4, 52) + rep(4:5, each=52) + rnorm(104))
Test$WeekTrt <- with(Test, interaction(Week, Treatment))
position(Test$Week) <- unique(Test$Week)
position(Test$WeekTrt) <- as.vector(outer(position(Test$Week), c(-.2, .2), `+`))

tapply(Test$y, Test[c("Week", "Treatment")], median)

bwplot( y ~ WeekTrt, groups = Treatment, data = Test,
      main="default panel.bwplot, groups ignored")

bwplot( y ~ WeekTrt, groups = Treatment, data = Test,
      panel=panel.bwplot.superpose,
      scales=list(x=list(limits=c(-1, 7))),
      main="Minimal use of panel.bwplot.superpose")

bwplot( y ~ WeekTrt, groups = Treatment, data = Test,
       panel=panel.bwplot.superpose,
       scales=list(x=list(limits=c(-1, 7), at=position(Test$Week))),
       box.width=.3,
       xlab="Week",
       pch=c(17, 16),
       key=list(col=trellis.par.get()$superpose.symbol$col[1:2],
           border=TRUE, title="Treatment", cex.title=1, columns=2,
           text=list(levels(Test$Treatment)),
           points=list(pch=c(17, 16))),
       par.settings=list(plot.symbol=list(pch=c(17, 16), cex=.5)),
       main="panel.bwplot.superpose with additional annotations")


bwplot( y ~ WeekTrt, groups = Treatment, data = Test,
       panel=panel.bwplot.superpose,
       scales=list(x=list(limits=c(-1, 7), at=position(Test$Week))),
       box.width=.3,
       xlab="Week",
       pch=c(17, 16),
       key=list(col=trellis.par.get()$superpose.symbol$col[1:2],
           border=TRUE, title="Treatment", cex.title=1, columns=2,
           text=list(levels(Test$Treatment)),
           points=list(pch=c(17, 16))),
       par.settings=list(plot.symbol=list(pch=c(17, 16), cex=.5)),
       main="panel.bwplot.superpose with fill and more complex panel.groups",
       panel.groups = function(...) {
           panel.stripplot(...)
           panel.bwplot.groups(...)
       },
       fill.alpha=.33,
       jitter.data = TRUE)




