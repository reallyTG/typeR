library(adegenet)


### Name: df2genind
### Title: Convert a data.frame of allele data to a genind object.
### Aliases: df2genind
### Keywords: manip

### ** Examples


## simple example
df <- data.frame(locusA=c("11","11","12","32"),
locusB=c(NA,"34","55","15"),locusC=c("22","22","21","22"))
row.names(df) <- .genlab("genotype",4)
df

obj <- df2genind(df, ploidy=2, ncode=1)
obj
tab(obj)


## converting a genind as data.frame
genind2df(obj)
genind2df(obj, sep="/")




