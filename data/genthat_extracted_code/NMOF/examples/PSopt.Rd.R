library(NMOF)


### Name: PSopt
### Title: Particle Swarm Optimisation
### Aliases: PSopt
### Keywords: optimize

### ** Examples

## Least Median of Squares (LMS) estimation
genData <- function(nP, nO, ol, dy) {
    ## create dataset as in Salibian-Barrera & Yohai 2006
    ## nP = regressors, nO  = number of obs
    ## ol = number of outliers, dy  = outlier size 
    mRN <- function(m, n) array(rnorm(m * n), dim = c(m, n))
    y <- mRN(nO, 1)
    X <- cbind(as.matrix(numeric(nO) + 1), mRN(nO, nP - 1L))
    zz <- sample(nO)
    z  <- cbind(1, 100, array(0, dim = c(1L, nP - 2L)))
    for (i in seq_len(ol)) {
        X[zz[i], ] <- z
        y[zz[i]] <- dy 
    }
    list(X = X, y = y)
}

OF <- function(param, data) {
    X <- data$X
    y <- data$y
    aux <- as.vector(y) - X %*% param
    ## as.vector(y) for recycling (param is a matrix)
    aux <- aux * aux
    aux <- apply(aux, 2, sort, partial = data$h)
    aux[h, ]
}

nP <- 2L; nO <- 100L; ol <- 10L; dy <- 150
aux <- genData(nP,nO,ol,dy); X <- aux$X; y <- aux$y

h <- (nO + nP + 1L) %/% 2
data <- list(y = y,X = X, h = h)

algo <- list(min = rep(-10, nP), max = rep( 10, nP),
    c1 = 1.0, c2 = 2.0,
    iner = 0.7, initV = 1, maxV = 3, 
    nP = 100L, nG = 300L, loopOF = FALSE)

system.time(sol <- PSopt(OF = OF, algo = algo, data = data))
if (require("MASS", quietly = TRUE)) {
    ## for nsamp = "best", in this case, complete enumeration 
    ## will be tried. See ?lqs
    system.time(test1 <- lqs(data$y ~ data$X[ ,-1L], 
            adjust = TRUE, 
            nsamp = "best", 
            method = "lqs", 
            quantile = data$h))
}
## check
x1 <- sort((y - X %*% as.matrix(sol$xbest))^2)[h]
cat("Particle Swarm\n",x1,"\n\n")

if (require("MASS", quietly = TRUE)) {
    x2 <- sort((y - X %*% as.matrix(coef(test1)))^2)[h]
    cat("lqs\n",x2,"\n\n")
}



