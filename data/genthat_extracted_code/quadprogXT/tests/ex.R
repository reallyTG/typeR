N <- 10
set.seed(2)
cr <- matrix(runif(N * N, 0, .5), N, N)
diag(cr) <- 1
cr <- (cr + t(cr)) / 2
set.seed(3)
sigs <- runif(N, min = .02, max = .25)
set.seed(5)

dvec <- runif(N, -.1, .1)
Dmat <- sigs %o% sigs * cr
Amat <- cbind(diag(N), diag(N) * -1)
bvec <- c(rep(-1, N), rep(-1, N))

#solveQPXT(Dmat, dvec, Amat, bvec)

res <- solveQPXT(Dmat, dvec, Amat, bvec, AmatPosNeg = matrix(rep(-1, 2 * N)), bvecPosNeg = -1)
w0 <- res$solution[1:N]

round(w0, 2)
pvar <- function(cv, w){
    as.numeric(w %*% cv %*% w)
}

ctr <- function(cv, w){
    pv <- pvar(cv, w)
    w * cv %*% w / pv
}

cv <- Dmat

round(ctr(cv, w0), 4)

dw <- rep(0, N)
dw[9] <- -.05
pv <- pvar(cv, w0)

c0 <- ctr(cv, w0)
ctr(cv, w0 + dw)

dfdw <- function(cv, w){
    res <- rep(0, N)
    for(i in 1:N){
        sig <- cv[i, ]
        sig[i] <- sig[i]
        res[i] <- as.numeric(sig %*% w)
    }
    res / pv
}

v <- dfdw(cv, w0)

x <- cbind(
    c0,
    ctr(cv, w0 + dw),
    c0 + v * dw
)
    
round(x, 4)

w0[9] * 2 * cv[9,9] + w0[9] * (cv[9, -9] %*% w0[-9]) / pv

(w0[9]^2 * cv[9,9] + w0[9] * c(cv[9, -9] %*% w0[-9])) / pv

