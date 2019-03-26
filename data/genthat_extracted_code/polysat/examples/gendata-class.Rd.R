library(polysat)


### Name: gendata-class
### Title: Class "gendata"
### Aliases: gendata-class deleteLoci,gendata-method
###   deleteSamples,gendata-method Description,gendata-method
###   Description<-,gendata-method initialize,gendata-method
###   Loci,gendata,missing,missing-method
###   Loci,gendata,numeric,missing-method
###   Loci,gendata,missing,numeric-method
###   Loci,gendata,numeric,numeric-method Loci<-,gendata-method
###   Missing,gendata-method Missing<-,gendata-method
###   Ploidies,gendata-method Ploidies<-,gendata-method
###   PopInfo,gendata-method PopInfo<-,gendata-method
###   PopNames,gendata-method PopNames<-,gendata-method
###   PopNum,gendata,character-method PopNum<-,gendata,character-method
###   Samples,gendata,character,missing-method
###   Samples,gendata,character,numeric-method
###   Samples,gendata,missing,missing-method
###   Samples,gendata,missing,numeric-method
###   Samples,gendata,numeric,missing-method
###   Samples,gendata,numeric,numeric-method Samples<-,gendata-method
###   summary,gendata-method Usatnts,gendata-method
###   Usatnts<-,gendata-method [,gendata-method
### Keywords: classes

### ** Examples

# show class definition
showClass("gendata")

# create an object of the class gendata
# (in reality you would want to create an object belonging to one of the
# subclasses, but the procedure is the same)
mygen <- new("gendata", samples = c("a", "b", "c"),
             loci = c("loc1", "loc2"))
Description(mygen) <- "An example for the documentation"
Usatnts(mygen) <- c(2,3)
PopNames(mygen) <- c("PopV", "PopX")
PopInfo(mygen) <- c(2,1,2)
Ploidies(mygen) <- c(2,2,4,2,2,2)

# view a summary of the object
summary(mygen)



