library(sfsmisc)


### Name: roundfixS
### Title: Round to Integer Keeping the Sum Fixed
### Aliases: roundfixS
### Keywords: arith manip

### ** Examples

## trivial example
kk <- c(0,1,7)
stopifnot(identical(kk, roundfixS(kk))) # failed at some point

x <- c(-1.4, -1, 0.244, 0.493, 1.222, 1.222, 2, 2, 2.2, 2.444, 3.625, 3.95)
sum(x) # an integer
r <- roundfixS(x)
stopifnot(all.equal(sum(r), sum(x)))
m <- cbind(x=x, `r2i(x)` = r, resid = x - r, `|res|` = abs(x-r))
rbind(m, c(colSums(m[,1:2]), 0, sum(abs(m[,"|res|"]))))

chk <- function(y) {
  cat("sum(y) =", format(S <- sum(y)),"\n")
  r2  <- roundfixS(y, method="offset")
  r2. <- roundfixS(y, method="round")
  r2_ <- roundfixS(y, method="1g")
  stopifnot(all.equal(sum(r2 ), S),
            all.equal(sum(r2.), S),
            all.equal(sum(r2_), S))
  all(r2 == r2. && r2. == r2_) # TRUE if all give the same result
}

makeIntSum <- function(y) {
   n <- length(y)
   y[n] <- ceiling(y[n]) - (sum(y[-n]) %% 1)
   y
}
set.seed(11)
y <- makeIntSum(rnorm(100))
chk(y)

## nastier example:
set.seed(7)
y <- makeIntSum(rpois(100, 10) + c(runif(75, min= 0, max=.2),
                                   runif(25, min=.5, max=.9)))
chk(y)

## Not run: 
##D for(i in 1:1000)
##D     stopifnot(chk(makeIntSum(rpois(100, 10) +
##D                              c(runif(75, min= 0, max=.2),
##D                                runif(25, min=.5, max=.9)))))
## End(Not run)



