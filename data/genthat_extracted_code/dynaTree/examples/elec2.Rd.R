library(dynaTree)


### Name: elec2
### Title: The ELEC2 Data Set
### Aliases: elec2
### Keywords: datasets

### ** Examples

## this is a snipet from the "elec2" demo; see that demo
## for a full comparison to dynaTree models which can
## cope with drifting concepts

## set up data
data(elec2)
X <- elec2[,1:4]
y <- drop(elec2[,5])

## predictive likelihood for repated trials
T <- 200 ## use nrow(X) for a longer version,
## short T is for faster CRAN checks
hits <-  rep(NA, T)

## fit the initial model
n <- 25; N <- 1000
fit <- dynaTree(X[1:n,], y[1:n], N=N, model="class")

w <- 1
for(t in (n+1):T) {

  ## predict the next data point
  ## full model
  fit <- predict(fit, XX=X[t,], yy=y[t])
  hits[t] <- which.max(fit$p) == y[t]

  ## sanity check retiring index
  if(any(fit$X[w,] != X[t-n,])) stop("bad retiring")

  ## retire
  fit <- retire(fit, w)
  ## update retiring index
  w <- w + 1; if(w >= n) w <- 1

  ## update with new point
  fit <- update(fit, X[t,], y[t], verb=100)
}

## free C-side memory
deleteclouds()

## plotting a moving window of hit rates over time
rhits <- rep(0, length(hits))
for(i in (n+1):length(hits)) {
  rhits[i] <- 0.05*as.numeric(hits[i]) + 0.95*rhits[i-1]
}

## plot moving window of hit rates
plot(rhits, type="l", main="moving window of hit rates",
     ylab="hit rates", xlab="t")



