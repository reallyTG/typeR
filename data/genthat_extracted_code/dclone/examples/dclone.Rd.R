library(dclone)


### Name: dclone
### Title: Cloning R objects
### Aliases: dclone dclone.default dclone.list dclone.environment
###   dclone.dcdim dclone.dciid dclone.dctr dcdim dciid dctr
### Keywords: manip

### ** Examples

## scalar
dclone(4, 2)
## vector
(x <- 1:6)
dclone(x, 2)
## matrix
(m <- matrix(x, 2, 3))
dclone(m, 2)
## data frame
(dfr <- as.data.frame(t(m)))
dclone(dfr, 2)
## list
(l <- list(n = 10, y = 1:10, x = 1:10, p = 1))
dclone(l, 2)
dclone(as.environment(l), 2)
dclone(l, 2, attrib = FALSE)
dclone(l, 2, multiply = "n", unchanged = "p")
## effect of dcdim
l$y <- dcdim(l$y)
dclone(l, 2, multiply = "n", unchanged = "p")
## time series like usage of dcdim
z <- data.matrix(rnorm(10))
dclone(dcdim(z), 2)
## usage if dciid
ll <- dciid(data.frame(x=1:10, y=1:10), iid="y")
dclone(ll, 2)
## respecting grouping structure in iid
ll$y <- rep(1:5, each=2)
(dci <- dclone(ll, 2))
nclones(dci)
## repeating the data column-wise
dclone(dctr(m), 2)



