library(robustbase)


### Name: colMedians
### Title: Fast Row or Column-wise Medians of a Matrix
### Aliases: colMedians rowMedians
### Keywords: array robust univar

### ** Examples

set.seed(1); n <- 234; p <- 543 # n*p = 127'062
x <- matrix(rnorm(n*p), n, p)
x[sample(seq_along(x), size= n*p / 256)] <- NA
R1 <- system.time(r1 <- rowMedians(x, na.rm=TRUE))
C1 <- system.time(y1 <- colMedians(x, na.rm=TRUE))
R2 <- system.time(r2 <- apply(x, 1, median, na.rm=TRUE))
C2 <- system.time(y2 <- apply(x, 2, median, na.rm=TRUE))
R2 / R1 # speedup factor: ~= 4   {platform dependent}
C2 / C1 # speedup factor: ~= 5.8 {platform dependent}
stopifnot(all.equal(y1, y2, tol=1e-15),
          all.equal(r1, r2, tol=1e-15))

(m <- cbind(x1=3, x2=c(4:1, 3:4,4)))
stopifnot(colMedians(m) == 3,
          all.equal(colMeans(m), colMedians(m)),# <- including names !
          all.equal(rowMeans(m), rowMedians(m)))



