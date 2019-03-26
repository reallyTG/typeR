library(simMSM)


### Name: simeventhistories
### Title: Simulate Event Histories
### Aliases: simeventhistories

### ** Examples

## An example for a time-varying setup without partial Markov effects:
tra2 <- matrix(ncol = 2, nrow = 2, data = FALSE)
tra2[1, 2] <- tra2[2, 1] <- TRUE
mpl <- mplskeleton(tmat = tra2)
mpl[[1]]$bhr[[2]] <- mpl[[2]]$bhr[[1]] <- function(t){return(0.5)}
mpl[[1]]$eta[[2]] <- function(x.i, t){ ## time-varying x2 and time-varying f(x2)
  ifelse(t < 5, 
         return(1.0 * x.i[1] + 0.5 * x.i[2]), 
         return(1.0 * x.i[1] + 1.0 * x.i[3]))}
mpl[[2]]$eta[[1]] <- function(x.i, t){ ## time-varying x2 and time-varying f(x1)
  ifelse(t < 5, 
         return(-0.5 * x.i[1] + 0.5 * x.i[2]), 
         return( 1.0 * x.i[1] + 0.5 * x.i[3]))}
set.seed(123)
N <- 2
X <- matrix(nrow = N, ncol = 2, rnorm(2 * N))
X <- cbind(X, X[, 2] + runif(N)/10)
colnames(X) <- c("x1", "x2.t1", "x2.t2")
Xstruc <- matrix(ncol = 2, nrow = 2, data = 0)
rownames(Xstruc) <- c("t1", "t2")
colnames(Xstruc) <- c("x1", "x2")
Xstruc[, 1] <- 1
Xstruc[, 2] <- c(2, 3)
d <- simeventhistories(n = N, mpl = mpl, X = X, max.time = 10, 
                       change.times = c(5), Xstruc = Xstruc)
head(d$msm.basics)
## Not run: 
##D ## An Illness-Death model example with time-varying setup and partial Markov 
##D ## effects:
##D traIDM <- matrix(nrow = 3, ncol = 3, FALSE)
##D traIDM[1, 2] <- traIDM[1, 3] <- traIDM[2, 1] <- traIDM[2, 3] <- TRUE
##D mpl <- mplskeleton(tmat = traIDM)
##D mpl[[1]]$bhr[[2]] <- mpl[[1]]$bhr[[3]] <- mpl[[2]]$bhr[[1]] <- 
##D                      mpl[[2]]$bhr[[3]] <- function(t){0.25}
##D mpl[[1]]$eta[[2]] <- mpl[[1]]$eta[[3]] <- mpl[[2]]$eta[[1]] <- 
##D   mpl[[2]]$eta[[3]] <- function(x.i, t){
##D     ifelse(t < 5, 
##D       return(0.5 * x.i[1]), 
##D       return(0.5 * x.i[2]))}
##D set.seed(123)
##D N <- 500
##D X <- matrix(nrow = N, ncol = 1, rnorm(N))
##D X <- cbind(X, X[, 1] + rnorm(N)/10)
##D colnames(X) <- c("x1.t1", "x1.t2")
##D Xstruc <- matrix(ncol = 1, nrow = 2, data = 0)
##D rownames(Xstruc) <- c("t1", "t2")
##D colnames(Xstruc) <- c("x1")
##D Xstruc[, 1] <- c(1, 2)
##D Xstruc
##D ## Now set-up the partial Markov influences:
##D ## Function 'partial.markov.x' has to take 5 input arguments representig vectors 
##D ## of past history information. They have to take names 'entry', 'exit', 'from', 
##D ## 'to', and 'delta':
##D partial.markov.x <- function(entry, exit, from, to, delta){
##D   count.12 <- sum(as.numeric((from == 1) & (to == 2) & (delta == 1)))
##D   count.21 <- sum(as.numeric((from == 2) & (to == 1) & (delta == 1)))
##D   return(c(count.12, count.21))}
##D ## List 'partial.markov.eta' is a list of lists in analogy to 'mpl':
##D partial.markov.eta <- pmeskeleton(traIDM)
##D partial.markov.eta[[1]][[2]] <- function(x){return( 0.25 * x[1])}
##D partial.markov.eta[[1]][[3]] <- function(x){return( 0.50 * x[1])}
##D partial.markov.eta[[2]][[1]] <- function(x){return(-0.50 * x[1] + 0.25 * x[2])}
##D partial.markov.eta[[2]][[3]] <- function(x){return(0)}
##D ## Event history simulation:
##D d <- simeventhistories(n = N, mpl = mpl, X = X, max.time = 10, 
##D                        change.times = c(5), Xstruc = Xstruc, 
##D                        partial.markov.x = partial.markov.x, 
##D                        partial.markov.eta = partial.markov.eta)
## End(Not run)



