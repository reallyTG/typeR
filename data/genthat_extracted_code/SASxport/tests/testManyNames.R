library(SASxport)
Sys.setenv("TZ"="GMT")

data(iris)

# to 'stress test' use 200 instead of 20
ncopies <- 20

## create a data file containing ncopies separate copies of the iris *dataframe*
manyDF.out <- rep(list(iris),ncopies)
names(manyDF.out) <- rep("iris", ncopies)
manyDF.out$file <- "manyDF.xport"

do.call(write.xport, manyDF.out)
manyDF.in <- read.xport(file="manyDF.xport")
names(manyDF.in)
head(manyDF.in[[ncopies]])
tail(manyDF.in[[ncopies]])
stopifnot( all( sapply(manyDF.in, dim)==c(150,5) ) )
stopifnot( all( sapply(manyDF.in, colnames) == colnames(manyDF.in[[ncopies]]) ) )

## create a data file containing a single dataframe that holds ncopies copies of
## the *columns* of the iris dataframe
manyCols.out <- do.call(cbind, rep(list(iris),ncopies))
dim(manyCols.out)
write.xport(manyCols.out, file="manyCols.xport")

manyCols.in <- read.xport("manyCols.xport")
names(manyCols.in)
stopifnot(dim(manyCols.in)==dim(manyCols.out))

