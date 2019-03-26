library(pROC)


### Name: ggroc.roc
### Title: Plot a ROC curve with ggplot2
### Aliases: ggroc.roc ggroc.list ggroc

### ** Examples

# Create a basic roc object
data(aSAH)
rocobj <- roc(aSAH$outcome, aSAH$s100b)
rocobj2 <- roc(aSAH$outcome, aSAH$wfns)

library(ggplot2)
g <- ggroc(rocobj)
g
# with additional aesthetics:
ggroc(rocobj, alpha = 0.5, colour = "red", linetype = 2, size = 2)

# You can then your own theme, etc.
g + theme_minimal() + ggtitle("My ROC curve")

# Multiple curves:
g2 <- ggroc(list(s100b=rocobj, wfns=rocobj2, ndka=roc(aSAH$outcome, aSAH$ndka)))
g2

# This is equivalent to using roc.formula:
roc.list <- roc(outcome ~ s100b + ndka + wfns, data = aSAH)
g.list <- ggroc(roc.list)
g.list

# with additional aesthetics:
g3 <- ggroc(roc.list, linetype=2)
g3
g4 <- ggroc(roc.list, aes="linetype", color="red")
g4

# OR faceting
g.list + facet_grid(.~name) + theme(legend.position="none")
# To have all the curves of the same color, use aes="group":
g.group <- ggroc(roc.list, aes="group")
g.group
g.group + facet_grid(.~name)




