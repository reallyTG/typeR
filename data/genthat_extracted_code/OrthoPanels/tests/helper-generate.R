generate_data <- function(N, T, K = 1,
                          rho = 0.5,
                          beta = rep(0.5, K),
                          f = rep(-1:1, length=N),
                          drop_outs = 0,
                          sd.y = 1) {
    ## $x_i = 0.75 f + N(0, 1)$:
    x <- array(.75*f, dim=c(N, K, T+1)) +
        rnorm(N*K*(T+1))

    # now rearrange X to have T as the first dimension and N as last
    x <- aperm(x, 3:1)

    ## $y_{i,t} = \rho y_{i,t-1} + \beta x_{i,t} + f_i + N(0,1)$:
    y <- matrix(0, T+1, N)
    for (t in 1:(T+1)) {
        yy <- if (t>1) y[t-1, ] else 0
        y[t,] <- f + rho * yy  + beta %*% x[t,,] + rnorm(N, sd = sd.y)
    }

    ## generate the required number of dropouts (assume none at T=0)
    for (i in sample(N, drop_outs)) {
        t <- sample(T, 1) + 1
        x[t,,i] <- NA
        y[t, i] <- NA
    }
    
    list(x = x, y = y)
}
