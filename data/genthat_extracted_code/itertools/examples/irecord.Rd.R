library(itertools)


### Name: irecord
### Title: Record and replay iterators
### Aliases: irecord ireplay
### Keywords: utilities

### ** Examples

suppressMessages(library(foreach))

m1 <- matrix(rnorm(70), 7, 10)
f1 <- tempfile()
irecord(f1, iter(m1, by='row', chunksize=3))

m2 <- matrix(1:50, 10, 5)
f2 <- tempfile()
irecord(f2, iter(m2, by='column', chunksize=3))

# Perform a simple out-of-core matrix multiply
p <- foreach(col=ireplay(f2), .combine='cbind') %:%
       foreach(row=ireplay(f1), .combine='rbind') %do% {
         row %*% col
       }

dimnames(p) <- NULL
print(p)
all.equal(p, m1 %*% m2)
unlink(c(f1, f2))



