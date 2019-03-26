library(extracat)


### Name: visid
### Title: Visualizing Indicator Matrices and Missing Values
### Aliases: visid visna visdf

### ** Examples


## Not run: 
##D require(reshape2)
##D require(scales)
##D 
##D MJ <- read.table(
##D "http://www.rosuda.org/~pilhoefer/MJnew.txt",
##D header=T,sep="\t",quote="")
##D 
##D 
##D MJS <- MJ[,13:105]
##D 
##D visid(MJS)
##D 
##D # sort by count/percentage
##D visid(MJS, sort="b")
##D 
##D # sort via ME
##D visid(MJS, sort = "b", sort.method="ME")
##D 
##D # only rows, only columns
##D visid(MJS, sort = "r", sort.method="ME")
##D visid(MJS, sort = "c", sort.method="ME")
##D 
##D # sort via optile
##D visid(MJS, sort = "b", sort.method="optile")
##D 
##D visid(MJS, sort = "b", sort.method="optile", iter=10)
##D 
##D visid(MJS, sort = "b", sort.method="optile",fun="ca")
##D 
##D # 24 rows
##D visid(MJS, sort = "r", sort.method="optile", fr=24)
##D 
##D 
##D # 24 rows, >= 40##D 
##D visid(MJS, sort = "r", sort.method="optile", fr=24, fc = 0.4)
##D 
##D 
##D # zoom y marginal
##D visid(MJS, sort = "r", sort.method="optile", fr=24, s=1)
##D 
##D 
##D # zoom x marginal
##D visid(MJS, sort = "r", sort.method="optile", fr=24, pmax=0.1, s =0.5)
##D 
## End(Not run)

# NA-example: GeneEx

visna(GeneEx, sort = "b", sort.method="optile", fr=50, pmax=0.05, s = 2)

require(MASS)
visdf(housing)
visdf(housing,opts=list(var.col="w"))

visdf(housing,opts=list(var.col="w"), sort="r")









