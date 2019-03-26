library(MSnbase)


### Name: FeaturesOfInterest-class
### Title: Features of Interest
### Aliases: FeaturesOfInterest-class FeaturesOfInterest
###   FeaturesOfInterest-methods
###   FeaturesOfInterest,character,character,missing-method
###   FeaturesOfInterest,character,character,MSnSet-method
###   description,FeaturesOfInterest-method foi,FeaturesOfInterest-method
###   foi foi-methods length,FeaturesOfInterest-method
###   show,FeaturesOfInterest-method fnamesIn fnamesIn-methods
###   fnamesIn,FeaturesOfInterest,MSnSet-method
###   fnamesIn,FeaturesOfInterest,matrix-method
###   fnamesIn,FeaturesOfInterest,data.frame-method FoICollection-class
###   FoICollection-methods FoICollection,list-method
###   FoICollection,missing-method FoICollection as.matrix.FoICollection
###   coerce,FoICollection,matrix-method addFeaturesOfInterest
###   addFeaturesOfInterest-methods
###   addFeaturesOfInterest,FeaturesOfInterest,FoICollection-method
###   description,FoICollection-method foi,FoICollection-method
###   length,FoICollection-method lengths,FoICollection-method
###   rmFeaturesOfInterest rmFeaturesOfInterest-methods
###   rmFeaturesOfInterest,FoICollection,numeric-method
###   show,FoICollection-method names,FoICollection-method
###   names<-,FoICollection,character-method [,FoICollection-method
###   [,FoICollection,ANY,ANY-method [,FoICollection,ANY,ANY,ANY-method
###   [[,FoICollection-method [[,FoICollection,ANY,ANY-method
### Keywords: classes

### ** Examples

library("pRolocdata")
data(tan2009r1)

x <- FeaturesOfInterest(description = "A traceable test set of features of interest",
                        fnames = featureNames(tan2009r1)[1:10],
                        object = tan2009r1)
x

description(x)
foi(x)

y <- FeaturesOfInterest(description = "Non-traceable features of interest",
                        fnames = featureNames(tan2009r1)[111:113])
y

## an illegal FeaturesOfInterest
try(FeaturesOfInterest(description = "Won't work",
                       fnames = c("A", "Z", featureNames(tan2009r1)),
                       object = tan2009r1))


FeaturesOfInterest(description = "This work, but not traceable",
                       fnames = c("A", "Z", featureNames(tan2009r1)))



xx <- FoICollection()
xx

xx <- addFeaturesOfInterest(x, xx)
xx <- addFeaturesOfInterest(y, xx)
names(xx) <- LETTERS[1:2]
xx

## Sub-setting
xx[1]
xx[[1]]
xx[["A"]]

description(xx)
foi(xx)

fnamesIn(x, tan2009r1)
fnamesIn(x, tan2009r1, count = TRUE)

rmFeaturesOfInterest(xx, 1)




