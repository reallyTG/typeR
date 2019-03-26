library(sirt)


### Name: md.pattern.sirt
### Title: Response Pattern in a Binary Matrix
### Aliases: md.pattern.sirt
### Keywords: Utilities

### ** Examples

#############################################################################
# EXAMPLE 1: Response patterns
#############################################################################
set.seed(7654)
N <- 21         # number of rows
I <- 4          # number of columns
dat <- matrix( 1*( stats::runif(N*I) > .3 ), N, I )
res <- sirt::md.pattern.sirt(dat)
# plot of response patterns
res$dat.ordered
image( z=t(res$dat.ordered), y=1:N, x=1:I, xlab="Items", ylab="Persons")
# 0's are yellow and 1's are red

#############################################################################
# EXAMPLE 2: Item response patterns for dataset data.read
#############################################################################

data(data.read)
dat <- data.read  ; N <- nrow(dat) ; I <- ncol(dat)
# order items according to p values
dat <- dat[, order(colMeans(dat, na.rm=TRUE )) ]
# analyzing response pattern
res <- sirt::md.pattern.sirt(dat)
res$dat.ordered
image( z=t(res$dat.ordered), y=1:N, x=1:I, xlab="Items", ylab="Persons")



