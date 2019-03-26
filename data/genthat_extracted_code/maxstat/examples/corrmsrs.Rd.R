library(maxstat)


### Name: corrmsrs
### Title: Correlation Matrix
### Aliases: corrmsrs
### Keywords: misc

### ** Examples


set.seed(29)

# matrix of hypothetical prognostic factors

X <- matrix(rnorm(30), ncol=3) 

# this function

a <- corrmsrs(X, minprop=0, maxprop=0.999)

# coded by just typing the definition of the correlation

testcorr <- function(X) {
  wh <- function(cut, x)
    which(x <= cut)
  index <- function(x) {
    ux <- unique(x)
    ux <- ux[ux < max(ux)]
    lapply(ux, wh, x = x)
  }
  a <- unlist(test <- apply(X, 2, index), recursive=FALSE)
  cnull <- rep(0, nrow(X))
  mycorr <- diag(length(a))
  for (i in 1:(length(a)-1)) {
    for (j in (i+1):length(a)) {
      cone <- cnull
      cone[a[[i]]] <- 1
      ctwo <- cnull
      ctwo[a[[j]]] <- 1
      sone <- sqrt(sum((cone - mean(cone))^2))
      stwo <- sqrt(sum((ctwo - mean(ctwo))^2))
      tcorr <- sum((cone - mean(cone))*(ctwo - mean(ctwo)))
      tcorr <- tcorr/(sone * stwo)
      mycorr[i,j] <- tcorr
    }
  }
  mycorr
}

tc <- testcorr(X)
tc <- tc + t(tc)
diag(tc) <- 1
stopifnot(all.equal(tc, a))




