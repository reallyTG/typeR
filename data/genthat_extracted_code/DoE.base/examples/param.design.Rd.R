library(DoE.base)


### Name: param.design
### Title: Function to generate Taguchi style parameter designs
### Aliases: param.design paramtowide
### Keywords: design array

### ** Examples

## It is recommended to use param.design particularly with FrF2 designs. 
## For the examples to run without package FrF2 loaded, 
## oa.design designs are used here.

## quick preliminary checks to try out possibilities
control <- oa.design(L18, columns=1:4, factor.names=paste("C",1:4,sep=""))
noise <- oa.design(L4.2.3, columns=1:3, factor.names=paste("N",1:3,sep=""))
## long
long <- param.design(control,noise)
## wide
wide <- param.design(control,noise,direction="wide")
wide
long

## use proper labelled factors
## should of course be as meaningful as possible for your data
fnc <- c(list(c("current","new")),rep(list(c("type1", "type2","type3")),3))
names(fnc) <- paste("C", 1:4, sep="")
control <- oa.design(L18, factor.names=fnc)
fnn <- rep(list(c("low","high")),3)
names(fnn) <- paste("N",1:3,sep="")
noise <- oa.design(L4.2.3, factor.names = fnn)
ex.inner.outer <- param.design(control,noise,direction="wide",responses=c("force","yield"))
ex.inner.outer              
## export e.g. to Excel or other program with which editing is more convenient
## Not run: 
##D    ### design written to default path as html and rda by export.design
##D    ### html can be opened with Excel
##D    ### data can be typed in 
##D    ### for preparation of loading back into R, 
##D    ###     remove all legend-like comment that does not belong to the data table itself
##D    ###     and store as csv
##D    ### reimport into R using add.response
##D    ### (InDec and OutDec are for working with German settings csv 
##D    ###     in an R with standard OutDec, i.e. wrong default option)
##D    getwd()  ## look at default path, works on most systems
##D    export.design(ex.inner.outer, OutDec=",")
##D    add.response("ex.inner.outer", "ex.inner.outer.csv", "ex.inner.outer.rda", InDec=",")
## End(Not run)



