library(HH)


### Name: panel.dotplot.tb
### Title: Dotplot with evenly spaced tiebreakers.
### Aliases: panel.dotplot.tb
### Keywords: dplot

### ** Examples

x <- c(1,1,2,2,2,5,4,2,1,5)
y <- factor(letters[rep(1:2, 5)])

dotplot(x, panel=panel.dotplot.tb)
dotplot(x, panel=panel.dotplot.tb, factor=.2)
dotplot(y ~ x, panel=panel.dotplot.tb)
dotplot(y ~ x, panel=panel.dotplot.tb, cex=1.5, factor=.15)



quiz <- data.frame(scores=sample(10, 360, replace=TRUE),
                   date=rep(rep(c("0902", "0916", "0930"), c(40,40,40)), 3),
                   section=rep(
                     c("Stat1-3", "Stat1-5", "Stat1-8"),
                     c(120,120,120)))

dotplot(date ~ scores | section, data=quiz,
        panel=panel.dotplot.tb, factor=.5)

dotplot(date ~ scores | section, data=quiz,
        panel=panel.dotplot.tb, factor=.5,
        layout=c(1,3), between=list(y=1),
        main='Three quizzes for three sections of Stat 1')


## If the formula includes one or more conditioning factors, then the
## user is responsible for providing a value for the argument max.freq
##
a <- rep(1, 10)
z <- c(1,1,2,2,2,3,2,3,1,1)
g <- LETTERS[c(1,1,1,1,1,2,2,2,2,2)]

print(split=c(1,1,2,1), more=TRUE,
dotplot( a ~ z | g, panel=panel.dotplot.tb,
        factor=.6, cex=1.5, layout=c(2,1),
        main="different scaling in each panel")
)

print(split=c(2,1,2,1), more=FALSE,
dotplot( a ~ z | g, panel=panel.dotplot.tb, max.freq=3,
        factor=.6, cex=1.5, layout=c(2,1),
        main="same scaling in each panel")
)




