library(polysat)


### Name: genambig-class
### Title: Class "genambig"
### Aliases: genambig-class deleteLoci,genambig-method
###   deleteSamples,genambig-method editGenotypes,genambig-method
###   estimatePloidy,genambig-method Genotype,genambig-method
###   Genotype<-,genambig-method Genotypes,genambig-method
###   Genotypes<-,genambig-method initialize,genambig-method
###   isMissing,genambig-method Loci<-,genambig-method
###   Missing<-,genambig-method Samples<-,genambig-method
###   summary,genambig-method viewGenotypes,genambig-method
###   [,genambig-method
### Keywords: classes

### ** Examples

# display class definition
showClass("genambig")

# create a genambig object
mygen <- new("genambig", samples=c("a", "b", "c", "d"),
             loci=c("L1", "L2", "L3"))
# add some genotypes
Genotypes(mygen)[,"L1"] <- list(c(133, 139, 145), c(142, 154),
                                c(130, 142, 148), Missing(mygen))
Genotypes(mygen, loci="L2") <- list(c(105, 109, 113), c(111, 117),
                                    c(103, 115), c(105, 109, 113))
Genotypes(mygen, loci="L3") <- list(c(254, 258), Missing(mygen),
                                    c(246, 250, 262), c(250, 258))

# see a summary of the object
summary(mygen)
# display some of the genotypes
viewGenotypes(mygen[c("a", "b", "c"),])



