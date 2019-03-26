library(adegenet)


### Name: genind2df
### Title: Convert a genind object to a data.frame.
### Aliases: genind2df
### Keywords: manip

### ** Examples


## simple example
df <- data.frame(locusA=c("11","11","12","32"),
locusB=c(NA,"34","55","15"),locusC=c("22","22","21","22"))
row.names(df) <- .genlab("genotype",4)
df

obj <- df2genind(df, ploidy=2, ncode=1)
obj
obj@tab


## converting a genind as data.frame
genind2df(obj)
genind2df(obj, sep="/")




