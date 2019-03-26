
### ceeboo 2007

## todo: special values NaN, NA, and Inf

library("proxy")

set.seed(20070630)

##

x <- matrix(runif(20),5,4)
inherits(x, "matrix")
rownames(x) <- LETTERS[1:5]
y <- x
y[2,] <- x[1,] <- 0

x
y

## user interfaces

r <- .Call("R_minkowski_dist", x, NULL, FALSE, 1, PACKAGE = "proxy")
all.equal(c(r), c(stats::dist(x, method = "minkowski", p = 1)))
r
.Call("R_minkowski_dist", x, x, FALSE, 1, PACKAGE = "proxy")
.Call("R_minkowski_dist", x, y, FALSE, 1, PACKAGE = "proxy")
.Call("R_minkowski_dist", x, y, TRUE,  1, PACKAGE = "proxy")

dfun <- paste("R",c("euclidean", "maximum", "manhattan", "canberra", "binary", "matching", "fuzzy", "mutual"),"dist", sep = "_")

for (f in dfun) {
    cat("\nTesting ",f,"\n\n",sep="")
    r <- try(do.call(".Call", list(f, x, NULL, FALSE, PACKAGE = "proxy")))
    if ( inherits(r, "try-error"))
	next
    s <- try(stats::dist(x, method = gsub("R_|_dist", "", f)))
    if (!inherits(s, "try-error"))
        print(all.equal(c(r), c(s)))
    print(r)
    print(do.call(".Call", list(f, x, x, FALSE, PACKAGE = "proxy")))
    print(do.call(".Call", list(f, x, y, FALSE, PACKAGE = "proxy")))
    print(do.call(".Call", list(f, x, y, TRUE,  PACKAGE = "proxy")))
}

## no longer optimized

.Call("R_ejaccard", x, NULL, FALSE, PACKAGE = "proxy")
.Call("R_ejaccard", x, x, FALSE, PACKAGE = "proxy")
.Call("R_ejaccard", x, y, FALSE, PACKAGE = "proxy")
.Call("R_ejaccard", x, y, TRUE, PACKAGE = "proxy")

.Call("R_cosine", x, NULL, FALSE, PACKAGE = "proxy")
.Call("R_cosine", x, x, FALSE, PACKAGE = "proxy")
.Call("R_cosine", x, y, FALSE, PACKAGE = "proxy")
.Call("R_cosine", x, y, TRUE, PACKAGE = "proxy")

x <- matrix(x > 0.5, 5,4)
y <- matrix(y > 0.5, 5,4)

.Call("R_bjaccard", x, NULL, FALSE, PACKAGE = "proxy")
.Call("R_bjaccard", x, x, FALSE, PACKAGE = "proxy")
.Call("R_bjaccard", x, y, FALSE, PACKAGE = "proxy")
.Call("R_bjaccard", x, y, TRUE, PACKAGE = "proxy")

###
