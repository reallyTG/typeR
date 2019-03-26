library(rpart.plot)


### Name: prp
### Title: Plot an rpart model.
### Aliases: prp
### Keywords: rpart recursive partitioning tree CART

### ** Examples

data(ptitanic)
tree <- rpart(survived ~ ., data = ptitanic, cp = .02)
                           # cp = .02 because want small tree for demo

old.par <- par(mfrow = c(2,2))
                           # put 4 figures on one page

prp(tree, main = "default prp\n(type =  0, extra = 0)")

prp(tree, main = "type = 4,  extra = 6\nbox.palette = \"auto\"",
    type = 4, extra = 6,   # label all nodes, show prob of second class
    box.palette = "auto",  # auto color the nodes based on the model type
    faclen = 0)            # faclen = 0 to print full factor names

cols <- ifelse(tree$frame$yval == 1, "darkred", "green4")
                           # green if survived

prp(tree, main = "assorted arguments",
    extra = 106,           # display prob of survival and percent of obs
    nn = TRUE,             # display the node numbers
    fallen.leaves = TRUE,  # put the leaves on the bottom of the page
    shadow.col = "gray",   # shadows under the leaves
    branch.lty = 3,        # draw branches using dotted lines
    branch = .5,           # change angle of branch lines
    faclen = 0,            # faclen = 0 to print full factor names
    trace = 1,             # print the auto calculated cex, xlim, ylim
    split.cex = 1.2,       # make the split text larger than the node text
    split.prefix = "is ",  # put "is " before split text
    split.suffix = "?",    # put "?" after split text
    col = cols, border.col = cols,   # green if survived
    split.box.col = "lightgray",   # lightgray split boxes (default is white)
    split.border.col = "darkgray", # darkgray border on split boxes
    split.round = .5)              # round the split box corners a tad

# compare to the plotting functions in the rpart package
plot(tree, uniform = TRUE, compress = TRUE, branch = .2)
text(tree, use.n = TRUE, cex = .8, xpd = NA) # cex is a guess, depends on your window size
title("compare to the plotting functions\nin the rpart package", cex.sub = .8)

par(old.par)



