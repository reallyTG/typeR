library(MSnbase)


### Name: FeatComp-class
### Title: Class '"FeatComp"'
### Aliases: FeatComp-class compfnames-methods
###   compfnames,MSnSet,MSnSet-method compfnames,list,missing-method
###   compfnames show,FeatComp-method names,FeatComp-method
###   common,FeatComp-method common,methods common unique1,FeatComp-method
###   unique1,methods unique1 unique2,FeatComp-method unique2,methods
###   unique2
### Keywords: classes

### ** Examples

library("pRolocdata")
data(tan2009r1)
data(tan2009r2)
x <- compfnames(tan2009r1, tan2009r2)
x[[1]]
x[2:3]
head(common(x[[1]]))

data(tan2009r3)
tanl <- list(tan2009r1, tan2009r2, tan2009r3)
xx <- compfnames(tanl, fcol1 = NULL)
length(xx)
tail(xx)

all.equal(xx[[15]],
          compfnames(tan2009r2, tan2009r3, fcol1 = NULL))
str(sapply(xx, common))



