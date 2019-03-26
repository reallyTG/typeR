library(ape)


### Name: phymltest
### Title: Fits a Bunch of Models with PhyML
### Aliases: phymltest print.phymltest summary.phymltest plot.phymltest
### Keywords: models

### ** Examples

### A `fake' example with random likelihood values: it does not
### make sense, but does not need PhyML and gives you a flavour
### of what the output looks like:
x <- runif(28, -100, -50)
names(x) <- ape:::.phymltest.model
class(x) <- "phymltest"
x
summary(x)
plot(x)
plot(x, main = "", col = "red")
### This example needs PhyML, copy/paste or type the
### following commands if you want to try them, eventually
### changing setwd() and the options of phymltest()
## Not run: 
##D setwd("D:/phyml_v2.4/exe") # under Windows
##D data(woodmouse)
##D write.dna(woodmouse, "woodmouse.txt")
##D X <- phymltest("woodmouse.txt")
##D X
##D summary(X)
##D plot(X)
## End(Not run)



