library(NMOF)


### Name: LSopt
### Title: Stochastic Local Search
### Aliases: LSopt
### Keywords: optimize

### ** Examples

## Aim: find the columns of X that, when summed, give y

## random data set
nc <- 25L          ## number of columns in data set
nr <- 5L           ## number of rows in data set
howManyCols <- 5L  ## length of true solution
X <- array(runif(nr*nc), dim = c(nr, nc))
xTRUE <- sample(1L:nc, howManyCols)
Xt <- X[ , xTRUE, drop = FALSE]
y <- rowSums(Xt)

## a random solution x0 ...
makeRandomSol <- function(nc) {
    ii <- sample.int(nc, sample.int(nc, 1L))
    x0 <- logical(nc); x0[ii] <- TRUE
    x0
}
x0 <- makeRandomSol(nc)

## ... but probably not a good one
sum(y - rowSums(X[ , xTRUE, drop = FALSE])) ## should be 0
sum(y - rowSums(X[ , x0, drop = FALSE])) 

## a neighbourhood function: switch n elements in solution
neighbour <- function(xc, Data) {
    xn <- xc
    p <- sample.int(Data$nc, Data$n)
    xn[p] <- !xn[p]
    if (sum(xn) < 1L)
        xn <- xc
    xn
}

## a greedy neighbourhood function
neighbourG <- function(xc, Data) {
    of <- function(x)
        abs(sum(Data$y - rowSums(Data$X[ ,x, drop = FALSE])))
    xbest <- xc
    Fxbest <- of(xbest)
    for (i in 1L:Data$nc) {
        xn <- xc; p <- i
        xn[p] <- !xn[p]
        if (sum(xn) >= 1L) {
            Fxn <- of(xn)
            if (Fxn < Fxbest) {
                xbest <- xn
                Fxbest <- Fxn
            }
        }
    }
    xbest
}

## an objective function
OF <- function(xn, Data)
    abs(sum(Data$y - rowSums(Data$X[ ,xn, drop = FALSE])))


## (1) GREEDY SEARCH
## note: this could be done in a simpler fashion, but the
##       redundancies/overhead here are small, and the example is to
##       show how LSopt can be used for such a search
Data <- list(X = X, y = y, nc = nc, nr = nr, n = 1L)
algo <- list(nS = 500L, neighbour = neighbourG, x0 = x0,
             printBar = FALSE, printDetail = FALSE)
solG <- LSopt(OF, algo = algo, Data = Data)

## after how many iterations did we stop?
iterG <- min(which(solG$Fmat[ ,2L] == solG$OFvalue))
solG$OFvalue  ## the true solution has OF-value 0

## (2) LOCAL SEARCH
algo$neighbour <- neighbour
solLS <- LSopt(OF, algo = algo, Data = Data)
iterLS <- min(which(solLS$Fmat[ ,2L] == solLS$OFvalue))
solLS$OFvalue  ## the true solution has OF-value 0

## (3) *Threshold Accepting*
algo$nT <- 10L
algo$nS <- ceiling(algo$nS/algo$nT)
algo$q <- 0.99
solTA <- TAopt(OF, algo = algo, Data = Data)
iterTA <- min(which(solTA$Fmat[ ,2L] == solTA$OFvalue))
solTA$OFvalue  ## the true solution has OF-value 0

## look at the solution
all <- sort(unique(c(which(solTA$xbest),
                     which(solLS$xbest),
                     which(solG$xbest),
                     xTRUE)))
ta <- ls <- greedy <- true <- character(length(all))
true[  match(xTRUE, all)] <- "o"
greedy[match(which(solG$xbest),  all)] <- "o"
ls[    match(which(solLS$xbest), all)] <- "o"
ta[    match(which(solTA$xbest), all)] <- "o"
data.frame(true = true, greedy = greedy, LS = ls , TA = ta,
           row.names=all)

## plot results
par(ylog = TRUE, mar = c(5,5,1,6), las = 1)
plot(solTA$Fmat[seq_len(iterTA) ,2L],type = "l", log = "y",
     ylim = c(1e-4,
              max(pretty(c(solG$Fmat,solLS$Fmat,solTA$Fmat)))),
     xlab = "iterations", ylab = "OF value", col = grey(0.5))
lines(cummin(solTA$Fmat[seq_len(iterTA), 2L]), type = "l")
lines(solG$Fmat[ seq_len(iterG),  2L], type = "p", col = "blue")
lines(solLS$Fmat[seq_len(iterLS), 2L], type = "l", col = "goldenrod3")
legend(x = "bottomleft",
       legend = c("TA best solution", "TA current solution",
                  "Greedy", "LS current/best solution"),
       lty = c(1,1,0,1),
       col = c("black",grey(0.5),"blue","goldenrod2"),
       pch = c(NA,NA,21,NA))
axis(4, at = c(solG$OFvalue, solLS$OFvalue, solTA$OFvalue),
        labels = NULL, las = 1)
lines(x = c(iterG, par()$usr[2L]), y = rep(solG$OFvalue,2),
      col = "blue", lty = 3)
lines(x = c(iterTA, par()$usr[2L]), y = rep(solTA$OFvalue,2),
      col = "black", lty = 3)
lines(x = c(iterLS, par()$usr[2L]), y = rep(solLS$OFvalue,2),
      col = "goldenrod3", lty = 3)



