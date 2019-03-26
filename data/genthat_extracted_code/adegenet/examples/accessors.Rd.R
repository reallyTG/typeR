library(adegenet)


### Name: Accessors
### Title: Accessors for adegenet objects
### Aliases: $,genind-method $,genpop-method $<-,genind-method
###   $<-,genpop-method [,genind-method [,genind,ANY,ANY,ANY-method
###   [,genpop-method [,genpop,ANY,ANY,ANY-method nLoc nLoc,gen-method
###   nLoc,genind-method nLoc,genpop-method locFac locFac,gen-method
###   locFac,genind-method locFac,genpop-method nAll nAll,gen-method
###   nAll,genind-method nAll,genpop-method nPop nPop,genind-method
###   nPop,genpop-method nInd nInd,genind-method pop pop<-
###   pop,genind-method pop<-,gen-method pop<-,genind-method locNames
###   locNames,gen-method locNames,genind-method locNames,genpop-method
###   locNames<- locNames<-,gen-method locNames<-,genind-method
###   locNames<-,genpop-method popNames popNames,genind-method
###   popNames,genpop-method popNames<- popNames<-,genind-method
###   popNames<-,genpop-method indNames indNames,genind-method indNames<-
###   indNames<-,genind-method ploidy ploidy,genind-method
###   ploidy,genpop-method ploidy<- ploidy<-,genind-method
###   ploidy<-,genpop-method alleles alleles,gen-method
###   alleles,genind-method alleles,genpop-method alleles<-
###   alleles<-,gen-method alleles<-,genind-method alleles<-,genpop-method
###   other other,gen-method other,genind-method other,genpop-method
###   other<- other<-,gen-method other<-,genind-method
###   other<-,genpop-method
### Keywords: manip

### ** Examples

data(nancycats)
nancycats
pop(nancycats) # get the populations
indNames(nancycats) # get the labels of individuals
locNames(nancycats) # get the labels of the loci
alleles(nancycats) # get the alleles

head(tab(nancycats)) # get allele counts

# get allele frequencies, replace NAs
head(tab(nancycats, freq = TRUE, NA.method = "mean")) 

# let's isolate populations 4 and 8
popNames(nancycats)
obj <- nancycats[pop=c(4,8)]
obj
popNames(obj)
pop(obj)

# let's isolate two markers, fca23 and fca90
locNames(nancycats)
obj <- nancycats[loc=c("fca23","fca90")]
obj
locNames(obj)

# illustrate pop
obj <- nancycats[sample(1:100, 10)]
pop(obj)
pop(obj) <- rep(c('b', 'a'), each = 5)
pop(obj)

# illustrate locNames
locNames(obj)
locNames(obj, withAlleles = TRUE)
locNames(obj)[1] <- "newLocus"
locNames(obj)
locNames(obj, withAlleles=TRUE)

# illustrate how 'other' slot is handled
data(sim2pop)
nInd(sim2pop)
other(sim2pop[1:6]) # xy is subsetted automatically
other(sim2pop[1:6, treatOther=FALSE]) # xy is left as is




