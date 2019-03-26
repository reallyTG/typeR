library(bulletcp)


### Name: detect_cp
### Title: Impute data and estimate groove locations.
### Aliases: detect_cp

### ** Examples

# Fake data
sim_groove <- function(beta = c(-0.28,0.28), a = 125)
{
    x <- seq(from = 0, to = 2158, by = 20)
    med <- median(x)
    y <- 1*(x <= a)*(beta[1]*(x - med) - beta[1]*(a - med)) +
    1*(x >= 2158 - a)*(beta[2]*(x - med) - beta[2]*(2158 - a - med))
    return(data.frame("x" = x, "y" = y))
}

fake_groove <- sim_groove()
cp_gibbs2 <- detect_cp(data = fake_groove,
                    verbose = FALSE,
                    tol_edge = 50,
                    tol_cp = 1000,
                    iter = 300,
                    warmup = 100,
                    est_impute_par = FALSE)




