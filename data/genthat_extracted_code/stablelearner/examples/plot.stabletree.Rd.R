library(stablelearner)


### Name: plot.stabletree
### Title: Visualizing Tree Stability Assessments
### Aliases: plot.stabletree barplot.stabletree image.stabletree
### Keywords: regression

### ** Examples


## No test: 

## build a tree
library("partykit")
m <- ctree(Species ~ ., data = iris)
plot(m)

## investigate stability
set.seed(0)
s <- stabletree(m, B = 500)

## show variable selection proportions
## with different labels and different ordering
barplot(s)
barplot(s, cex.names = 0.8)
barplot(s, names.diag = FALSE)
barplot(s, names.arg = c("a", "b", "c", "d"))
barplot(s, names.uline = FALSE)
barplot(s, col = c("lightgreen", "darkred"))
barplot(s, horiz = TRUE)

## illustrate variable selections of replications
## with different labels and different ordering
image(s)
image(s, cex.names = 0.8)
image(s, names.diag = FALSE)
image(s, names.arg = c("a", "b", "c", "d"))
image(s, names.uline = FALSE)
image(s, col = c("lightgreen", "darkred"))
image(s, order.row = FALSE)
image(s, order.col = FALSE)

## graphical cutpoint analysis, selecting variable by number and name
## with different numerical of break points
plot(s)
plot(s, select = 3)
plot(s, select = "Petal.Width")
plot(s, args.numeric = list(breaks = 40))

# change labels of splits in complete data tree
plot(s, select = 3, type.labels = "levels")
plot(s, select = 3, type.labels = "nodeids")
plot(s, select = 3, type.labels = "breaks")
plot(s, select = 3, type.labels = "none")

## End(No test)




