library(pairwiseCI)


### Name: summary.pairwiseTest
### Title: Summary function for "pairwiseTest"
### Aliases: summary.pairwiseTest
### Keywords: htest print

### ** Examples


data(Oats)
apOats<-pairwiseTest(yield~nitro, data=Oats,
 by="Variety", method="t.test", var.equal=FALSE)
apOats

# summary just creates a data.frame from the output
summary(apOats)

# an allows application of p.adjust
# on the p.values:

summary(apOats, p.adjust.method="holm")

# See ?p.adjust.methods for the methods available.




