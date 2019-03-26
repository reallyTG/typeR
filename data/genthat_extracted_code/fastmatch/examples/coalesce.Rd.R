library(fastmatch)


### Name: coalesce
### Title: Create an index that groups unique values together
### Aliases: coalesce
### Keywords: manip

### ** Examples

i = rnorm(2e6)
names(i) = as.integer(rnorm(2e6))
## compare sorting and coalesce
system.time(o <- i[order(names(i))])
system.time(o <- i[coalesce(names(i))])

## more fair comparison taking the coalesce time (and copy) into account
system.time(tapply(i, names(i), sum))
system.time({ o <- i[coalesce(names(i))]; ctapply(o, names(o), sum) })

## in fact, using ctapply() on a dummy vector is faster than table() ...
## believe it or not ... (that that is actually wasteful, since coalesce
## already computed the table internally anyway ...)
ftable <- function(x) {
   t <- ctapply(rep(0L, length(x)), x[coalesce(x)], length)
   t[sort.list(names(t))]
}
system.time(table(names(i)))
system.time(ftable(names(i)))



