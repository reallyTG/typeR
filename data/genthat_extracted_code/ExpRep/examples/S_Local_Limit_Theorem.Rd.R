library(ExpRep)


### Name: S_Local_Limit_Theorem
### Title: Simulations of Local Theorem of DeMoivre-Laplace
### Aliases: S_Local_Limit_Theorem

### ** Examples

S_Local_Limit_Theorem(n = 170, p = 0.5, Compare = TRUE, Table = TRUE, Graph = TRUE, 
     GraphE = TRUE)

## The function is currently defined as
function (n = 170, p = 0.5, Compare = TRUE, Table = TRUE, Graph = TRUE, GraphE = TRUE) 
  { layout(matrix(1))
    m <- array(0:n)
    x <- numeric()
    PNormal <- numeric()
    a <- n * p
    b <- sqrt(a * (1 - p))
    for (mi in 1:(n + 1)) {
        x[mi] <- (mi - 1 - a)/b
        PNormal[mi] <- dnorm(x[mi], 0, 1)/b
    }
    if (Compare == TRUE) {
        PBin <- numeric()
        for (mi in 1:(n + 1)) PBin[mi] <- dbinom(mi - 1, n, p)
        Dif <- abs(PBin - PNormal)
    }
    if (Graph == TRUE & GraphE == TRUE) {
        layout(matrix(c(1, 1, 2, 2), 2, 2, byrow = TRUE))
    }
    if (Graph == TRUE) {
        mfg <- c(1, 1, 2, 2)
        plot(PNormal, type = "p", main = "The Local Limit Theorem", 
            xlab = "m", ylab = "Probability", col = "red")
        mtext("Local Theorem", line = -1, side = 3, adj = 1, 
            col = "red")
        if (Compare == TRUE) {
            points(PBin, type = "p", col = "blue")
            mtext("Binomial Probability", line = -2, side = 3, 
                adj = 1, col = "blue")
        }
    }
    if (GraphE == TRUE) {
        mfg <- c(2, 1, 2, 2)
        dmini <- min(Dif) - 0.01
        dmaxi <- max(Dif) + 0.01
        plot(Dif, ylim = c(dmini, dmaxi), type = "b", main = "Errors", 
            xlab = "m", ylab = "Errors", col = "green")
        abline(a = 0, b = 0, col = "red")
    }
    if (Table == TRUE) {
        if (Compare == TRUE) 
            TablaR <- data.frame(m = m, x = x, PBinomial = PBin, 
                TLocal = PNormal, Difference = Dif)
        else TablaR <- data.frame(m = m, x = x, TLocal = PNormal)
        TablaR
    }
  }



