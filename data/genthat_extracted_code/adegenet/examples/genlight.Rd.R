library(adegenet)


### Name: genlight-class
### Title: Formal class "genlight"
### Aliases: genlight genlight-class [,genlight-method
###   [,genlight,ANY,ANY-method [,genlight,ANY,ANY,ANY-method
###   initialize,genlight-method show,genlight-method tab,genlight-method
###   nLoc,genlight-method nInd,genlight-method dim,genlight-method
###   nPop,genlight-method $,genlight-method $<-,genlight-method
###   names,genlight-method ploidy,genlight-method ploidy<-,genlight-method
###   locNames,genlight-method locNames<-,genlight-method
###   indNames,genlight-method indNames<-,genlight-method
###   popNames,genlight-method popNames<-,genlight-method
###   alleles,genlight-method alleles<-,genlight-method chromosome
###   chromosome<- chromosome,genlight-method chromosome<-,genlight-method
###   chr chr<- chr,genlight-method chr<-,genlight-method position
###   position<- position,genlight-method position<-,genlight-method
###   pop,genlight-method pop<-,genlight-method NA.posi
###   NA.posi,genlight-method other,genlight-method other<-,genlight-method
###   as.matrix.genlight as.data.frame.genlight as,matrix,genlight-method
###   as,data.frame,genlight-method as,list,genlight-method
###   coerce,matrix,genlight-method coerce,data.frame,genlight-method
###   coerce,list,genlight-method as.list.genlight cbind.genlight
###   rbind.genlight
### Keywords: classes

### ** Examples

## Not run: 
##D ## TOY EXAMPLE ##
##D ## create and convert data
##D dat <- list(toto=c(1,1,0,0), titi=c(NA,1,1,0), tata=c(NA,0,3, NA))
##D x <- new("genlight", dat)
##D x
##D 
##D ## examine the content of the object
##D names(x)
##D x@gen
##D x@gen[[1]]@snp # bit-level coding for first individual
##D 
##D ## conversions
##D as.list(x)
##D as.matrix(x)
##D 
##D ## round trips - must return TRUE
##D identical(x, new("genlight", as.list(x))) # list
##D identical(x, new("genlight", as.matrix(x))) # matrix
##D identical(x, new("genlight", as.data.frame(x))) # data.frame
##D 
##D ## test subsetting
##D x[c(1,3)] # keep individuals 1 and 3
##D as.list(x[c(1,3)])
##D x[c(1,3), 1:2] # keep individuals 1 and 3, loci 1 and 2
##D as.list(x[c(1,3), 1:2])
##D x[c(TRUE,FALSE), c(TRUE,TRUE,FALSE,FALSE)] # same, using logicals
##D as.list(x[c(TRUE,FALSE), c(TRUE,TRUE,FALSE,FALSE)])
##D 
##D 
##D ## REAL-SIZE EXAMPLE ##
##D ## 50 genotypes of 1,000,000 SNPs
##D dat <- lapply(1:50, function(i) sample(c(0,1,NA), 1e6, prob=c(.5, .49, .01), replace=TRUE))
##D names(dat) <- paste("indiv", 1:length(dat))
##D print(object.size(dat), unit="aut") # size of the original data
##D 
##D x <- new("genlight", dat) # conversion
##D x
##D print(object.size(x), unit="au") # size of the genlight object
##D object.size(dat)/object.size(x) # conversion efficiency
##D 
##D 
##D 
##D #### cbind, rbind ####
##D a <- new("genlight", list(toto=rep(1,10), tata=rep(c(0,1), each=5), titi=c(NA, rep(1,9)) ))
##D 
##D ara <- rbind(a,a)
##D ara
##D as.matrix(ara)
##D 
##D aca <- cbind(a,a)
##D aca
##D as.matrix(aca)
##D 
##D 
##D #### subsetting @other ####
##D x <- new("genlight", list(a=1,b=0,c=1), other=list(1:3, letters,data.frame(2:4)))
##D x
##D other(x)
##D x[2:3]
##D other(x[2:3])
##D other(x[2:3, treatOther=FALSE])
##D 
##D 
##D #### seppop ####
##D pop(x) # no population info
##D pop(x) <- c("pop1","pop1", "pop2") # set population memberships
##D pop(x)
##D seppop(x)
## End(Not run)



