library(rpart.plot)


### Name: rpart.plot
### Title: Plot an rpart model. A simplified interface to the prp function.
### Aliases: rpart.plot
### Keywords: rpart recursive partitioning tree CART

### ** Examples

old.par <- par(mfrow=c(2,2))            # put 4 figures on one page

data(ptitanic)

#---------------------------------------------------------------------------

binary.model <- rpart(survived ~ ., data = ptitanic, cp = .02)
                                        # cp = .02 for small demo tree

rpart.plot(binary.model,
           main = "titanic survived\n(binary response)")

rpart.plot(binary.model, type = 3, clip.right.labs = FALSE,
           branch = .4,
           box.palette = "Grays",       # override default GnBu palette
           main = "type = 3, clip.right.labs = FALSE, ...\n")

#---------------------------------------------------------------------------

anova.model <- rpart(Mileage ~ ., data = cu.summary)

rpart.plot(anova.model,
           shadow.col = "gray",         # add shadows just for kicks
           main = "miles per gallon\n(continuous response)\n")

#---------------------------------------------------------------------------

multi.class.model <- rpart(Reliability ~ ., data = cu.summary)

rpart.plot(multi.class.model,
           main = "vehicle reliability\n(multi class response)")

par(old.par)



