library(rpart.plot)


### Name: rpart.plot.version1
### Title: Plot an rpart model (old version).
### Aliases: rpart.plot.version1
### Keywords: rpart recursive partitioning tree CART

### ** Examples

data(ptitanic)
tree <- rpart(survived ~ ., data = ptitanic, cp = .02)
                                # cp = .02 because want small tree for demo

old.par <- par(mfrow = c(2,2))
                                # put 4 figures on one page

rpart.plot.version1(tree, main = "default rpart.plot.version1\n(type = 0, extra = 0)")

rpart.plot.version1(tree, main = "type = 4, extra = 6",
                    type = 4, extra = 6,
                    faclen = 0) # faclen = 0 to print full factor names

rpart.plot.version1(tree, main = "extra = 106,  under = TRUE",
                    extra = 106, under = TRUE, faclen = 0)

# compare to the plotting functions in the rpart package
plot(tree, uniform = TRUE, compress = TRUE, branch = .2)
text(tree, use.n = TRUE, cex = .8, xpd = NA) # cex is a guess, depends on your window size
title("compare to the plotting functions\nin the rpart package", cex.sub = .8)

par(old.par)



