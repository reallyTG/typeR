## Watson test
context("Watson test")
test_that("Watson tests", {
    wx0 <- function (n = 15)
    {
        if (!(2 <= n && n <= 31)) {
            stop("Watson: n must be between 2-31")
        }
        rep(0, n)
    }
    waf <- function (par)
    {
        n <- length(par)
        if (!(2 <= n && n <= 31)) {
            stop("Watson: n must be between 2-31")
        }
        fsum <- 0
        for (i in 1:29) {
            ti <- i/29
            fa <- 0
            fb <- 0
            tij2 <- ti^(0:(n - 2))
            tij1 <- ti^(0:(n - 1))
            fa <- sum(1:(n - 1) * par[2:n] * tij2)
            fb <- sum(par * tij1)
            fi <- fa - fb * fb - 1
            fsum <- fsum + fi * fi
        }
        f30 <- par[1]
        f31 <- par[2] - par[1]^2 - 1
        fsum + f30 * f30 + f31 * f31
    }
    wag <- function (par)
    {
        n <- length(par)
        if (!(2 <= n && n <= 31)) {
            stop("Watson: n must be between 2-31")
        }
        grad <- rep(0, n)
        for (i in 1:29) {
            ti <- i/29
            fa <- 0
            fb <- 0
            tij2 <- ti^(-1:(n - 2))
            tij1 <- ti^(0:(n - 1))
            fa <- sum(1:(n - 1) * par[2:n] * tij2[2:length(tij2)])
            fb <- sum(par * tij1)
            fi <- fa - fb * fb - 1
            fi2 <- 2 * fi
            grad <- grad + fi2 * (0:(n - 1) * tij2 - 2 * fb * tij1)
        }
        f31 <- par[2] - par[1]^2 - 1
        grad[1] <- grad[1] + 2 * par[1]
        grad[1] <- grad[1] - 4 * par[1] * f31
        grad[2] <- grad[2] + 2 * f31
        grad
    }
    n <- 12
    x0 <- wx0(n)

    w12lbfsgb3c1 <- lbfgsb3c(x0, waf, wag, control=list(trace=0, maxit=100))
    w12lbfsgb3c <- lbfgsb3c(x0, waf, wag, control=list(trace=0, maxit=200))

    sapply(c("windows", "mac", "solaris"), skip_on_os)

    expect_equal(signif(c(-0.00133539993979, 0.994186861341212, 0.0650491836304563, 0.148060006054429,
                          0.159729548119786, 0.112175310850094, 0.0518418014610908, 0.00429363807673548,
                          -0.0201841900693294, -0.0192093772581993, 0.00599755665175255,
                          0.0527972408079066), 4), signif(w12lbfsgb3c1$par, 4))



    expect_equal(signif(c(-3.6501245017782e-05, 0.998578283855827, 0.0236942986141338,
                          0.232315270527922, 0.156662693345513, 0.0599056623796327, 0.0115251661497374,
                          0.00389789062742777, 0.0147726349797423, 0.0256453103733045,
                          0.0247176731368071, 0.00571879697070168), 4), signif(w12lbfsgb3c$par, 4))
})
