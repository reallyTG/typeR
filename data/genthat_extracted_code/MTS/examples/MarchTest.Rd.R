library(MTS)


### Name: MarchTest
### Title: Multivariate ARCH test
### Aliases: MarchTest

### ** Examples

zt=matrix(rnorm(600),200,3)
MarchTest(zt)
function (zt, lag = 10) 
{
    if (!is.matrix(zt)) 
        zt = as.matrix(zt)
    nT = dim(zt)[1]
    k = dim(zt)[2]
    C0 = cov(zt)
    zt1 = scale(zt, center = TRUE, scale = FALSE)
    C0iv = solve(C0)
    wk = zt1 %*% C0iv
    wk = wk * zt1
    rt2 = apply(wk, 1, sum) - k
    m1 = acf(rt2, lag.max = lag, plot = F)
    acf = m1$acf[2:(lag + 1)]
    c1 = c(1:lag)
    deno = rep(nT, lag) - c1
    Q = sum(acf^2/deno) * nT * (nT + 2)
    pv1 = 1 - pchisq(Q, lag)
    cat("Q(m) of squared series(LM test): ", "\n")
    cat("Test statistic: ", Q, " p-value: ", pv1, "\n")
    rk = rank(rt2)
    m2 = acf(rk, lag.max = lag, plot = F)
    acf = m2$acf[2:(lag + 1)]
    mu = -(rep(nT, lag) - c(1:lag))/(nT * (nT - 1))
    v1 = rep(5 * nT^4, lag) - (5 * c(1:lag) + 9) * nT^3 + 9 * 
        (c(1:lag) - 2) * nT^2 + 2 * c(1:lag) * (5 * c(1:lag) + 
        8) * nT + 16 * c(1:lag)^2
    v1 = v1/(5 * (nT - 1)^2 * nT^2 * (nT + 1))
    QR = sum((acf - mu)^2/v1)
    pv2 = 1 - pchisq(QR, lag)
    cat("Rank-based Test: ", "\n")
    cat("Test statistic: ", QR, " p-value: ", pv2, "\n")
    cat("Q_k(m) of squared series: ", "\n")
    x = zt^2
    g0 = var(x)
    ginv = solve(g0)
    qm = 0
    df = 0
    for (i in 1:lag) {
        x1 = x[(i + 1):nT, ]
        x2 = x[1:(nT - i), ]
        g = cov(x1, x2)
        g = g * (nT - i - 1)/(nT - 1)
        h = t(g) %*% ginv %*% g %*% ginv
        qm = qm + nT * nT * sum(diag(h))/(nT - i)
        df = df + k * k
    }
    pv3 = 1 - pchisq(qm, df)
    cat("Test statistic: ", qm, " p-value: ", pv3, "\n")
    cut1 = quantile(rt2, 0.95)
    idx = c(1:nT)[rt2 <= cut1]
    x = zt[idx, ]^2
    eT = length(idx)
    g0 = var(x)
    ginv = solve(g0)
    qm = 0
    df = 0
    for (i in 1:lag) {
        x1 = x[(i + 1):eT, ]
        x2 = x[1:(eT - i), ]
        g = cov(x1, x2)
        g = g * (eT - i - 1)/(eT - 1)
        h = t(g) %*% ginv %*% g %*% ginv
        qm = qm + eT * eT * sum(diag(h))/(eT - i)
        df = df + k * k
    }
    pv4 = 1 - pchisq(qm, df)
    cat("Robust Test(5%) : ", qm, " p-value: ", pv4, "\n")
  }



