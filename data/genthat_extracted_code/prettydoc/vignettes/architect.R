## ----fig.width=6, fig.height=6, fig.align='center'-----------------------
set.seed(123)
n <- 1000
x1  <- matrix(rnorm(n), ncol = 2)
x2  <- matrix(rnorm(n, mean = 3, sd = 1.5), ncol = 2)
x   <- rbind(x1, x2)
smoothScatter(x, xlab = "x1", ylab = "x2")
head(x)

