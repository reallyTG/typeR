## ----preliminaries, echo=FALSE, warning = FALSE, message = FALSE, results='hide'----
hasMosek <- require("Rmosek", quietly = TRUE)                
if(hasMosek) 
    hasMosek <- tryCatch(example(mosek)$value$response$code == 0,
			   warning = function(c) 0,
			   error = function(c) 0)
if (!hasMosek) {                                                                     
                knitr::opts_chunk$set(eval = FALSE)                                   
                msg <- paste("This vignette requires Mosek, but this system",
                             "does not have Mosek",
                             "installed, so code examples will not be evaluated.")
                msg <- paste(strwrap(msg), collapse="\n")
                message(msg) 
            }
require("REBayes")
knitr::render_sweave()
options(prompt = "R> ", continue = "+  ", digits = 3, show.signif.stars = FALSE)
cleanup <- FALSE

## ----Xsetup, include = FALSE---------------------------------------------
X.cap <- "Four estimates of the mixing distributions $G$:  In the left panel the 
true mixing distribution is smooth, in the left panel it is discrete as described
in the text.  
"

## ----X, fig.height = 6, fig.width = 9, fig.cap = X.cap, cache = TRUE, message = FALSE, warnings = FALSE, echo = FALSE----
KFE <- function(y, T = 300, lambda = 1/3){
    # Kernel Fourier Estimator: Stefanski and Carroll (Statistics, 1990)
    ks <- function(s,x) exp(s^2/2) * cos(s * x)
    K <- function(t, y, lambda = 1/3){
	k <- y
	for(i in 1:length(y)){
	    k[i] <- integrate(ks, 0, 1/lambda, x = (y[i] - t))$value/pi 
	}
	mean(k)
    }
    eps <- 1e-04
    if(length(T) == 1) T <- seq(min(y)-eps, max(y)+eps, length = T)
    g <- T
    for(j in 1:length(T))
	g[j] <- K(T[j], y, lambda = lambda)
    list(x = T, y = g)
}
BDE <- function(y, T = 300, df = 5, c0 = 1){
    # Bayesian Deconvolution Estimator: Efron (B'ka, 2016)
    require(splines)
    eps <- 1e-04
    if(length(T) == 1) T <- seq(min(y)-eps, max(y)+eps, length = T)
    X <- ns(T, df = df)
    a0 <- rep(0, ncol(X))
    A <- dnorm(outer(y,T,"-"))
    qmle <- function(a, X, A, c0){
	g <- exp(X %*% a)
	g <- g/sum(g)
	f <- A %*% g
	-sum(log(f)) + c0 * sum(a^2)^.5
    }
    ahat <- nlm(qmle, a0, X=X, A=A, c0 = c0)$estimate
    g <- exp(X %*% ahat)
    g <- g/integrate(approxfun(T,g),min(T),max(T))$value
    list(x = T,y = g)
}
W <- function(G, h, interp = FALSE, eps = 0.001){
    #Wasserstein distance:  ||G-H||_W
    H <- cumsum(h$y)
    H <- H/H[length(H)]
    W <- integrate(approxfun(h$x, abs(G(h$x) - H)),min(h$x),max(h$x))$value
    list(W=W, H=H)
}

biweight <- function(x0, x, bw){
    t <- (x - x0)/bw
    (1-t^2)^2*((t> -1 & t<1)-0) *15/16
}
Wasser <- function(G, h, interp = FALSE, eps = 0.001, bw = 0.7){
    #Wasserstein distance:  ||G-H||_W
    if(interp == "biweight"){
	yk = h$x
	for (j in 1:length(yk))
	    yk[j] = sum(biweight(h$x[j], h$x, bw = bw)*h$y/sum(h$y))
	H <- cumsum(yk)
	H <- H/H[length(H)]
    }
    else {
	H <- cumsum(h$y)
	H <- H/H[length(H)]
    }
    W <- integrate(approxfun(h$x, abs(G(h$x) - H)),min(h$x),max(h$x), subdivisions = 500)$value
    list(W=W, H=H)
}
set.seed(1234)
par(mfrow = c(1,2))
for(i in 1:2){
    if(i == 1){
	G0 <- function(t) punif(t,0,6)/8 + 7 * pnorm(t, 0, 0.5)/8  
	rf0 <- function(n){
	    s <- sample(0:1, n, replace = TRUE, prob = c(1,7)/8)
	    rnorm(n) + (1-s) * runif(n,0,6) + s * rnorm(n,0,0.5)
	}
    }
    else{
	G0 <- function(t) 0 + 7 * (t > 0)/8 + (t > 2)/8
	rf0 <- function(n){
	    s <- sample(0:1, n, replace = TRUE, prob = c(1,7)/8)
	    rnorm(n) + (1-s) * 2 + s * 0
	}
    }
    y <- rf0(1000)
    t1 <- system.time(g1 <- BDE(y))
    W1 <- Wasser(G0, g1)
    t2 <- system.time(g2 <- GLmix(y))
    W2 <- Wasser(G0, g2)
    t3 <- system.time(g3 <- KFE(y))
    W3 <- Wasser(G0, g3)
    W4 <- Wasser(G0, g2, interp = "biweight")
    plot(g1$x, G0(g1$x), type = "l", ylim = c(-0.1, 1.1), xlab = "x", ylab = "G(x)")
    lines(g1$x, W1$H,col = 2)
    lines(g2$x, W2$H, col = 3)
    lines(g3$x, W3$H, col = 4)
    lines(g2$x, W4$H, col = 5)
    legend(x = "bottomright", legend= c("True", "Efron","KW", "SC", "KWs"), col = 1:5, lwd = 1.5)
    title(paste("W(E) = ", round(W1$W,3), "; ", "W(KW) = ", round(W2$W,3), 
	    "; ", "W(SC) = ", round(W3$W,3), "; ", "W(KWs) = ", round(W4$W,3), sep = ""), cex.main = 0.75)
}

## ----Y,  cache = TRUE, message = FALSE, warnings = FALSE, echo = FALSE----
sim1 <- function(n, R = 10){
    A <- matrix(0, 3, R)
    G0 <- function(t) punif(t,0,6)/8 + 7 * pnorm(t, 0, 0.5)/8  
    rf0 <- function(n){
	s <- sample(0:1, n, replace = TRUE, prob = c(1,7)/8)
	rnorm(n) + (1-s) * runif(n,0,6) + s * rnorm(n,0,0.5)
    }
    for(i in 1:R){
	y <- rf0(n)
	g <- BDE(y)
	Wg <- Wasser(G0, g)
	h <- GLmix(y)
	Wh <- Wasser(G0, h)
	Whs <- Wasser(G0, h, interp = "biweight")
	A[,i] <- c(Wg$W, Wh$W, Whs$W)
	}
    A
}
set.seed(12)
A <- sim1(1000)
a <- round(apply(A,1,mean),3)

