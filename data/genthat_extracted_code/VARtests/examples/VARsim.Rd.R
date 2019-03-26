library(VARtests)


### Name: VARsim
### Title: Simulates vector autoregressive (VAR) series
### Aliases: VARsim

### ** Examples


# Simulates from a fitted DGP:
fit <- VARfit(y = VodafoneCDS, p = 1, const = TRUE)
y <- VARsim(fittedModel = fit)
VARfit(y = y, p = 1, const = TRUE)

# Simulates from user given parameters. 
#  Includes an exogenous variable:
VARcoef <- matrix(c(1,     2,
                    1,   0.5,
                    0.1,  0.3,
                    0.2,  0.5), 
                  ncol = 2, byrow = TRUE)
exo <- matrix(rnorm(500))
y <- VARsim(N = 500, K = 2, p = 1, const = TRUE, 
            trend = FALSE, exogen = exo,
            coef = VARcoef, dist = "normal")
VARfit(y = y, p = 1, const = TRUE, exogen = exo)

## Not run: 
##D 
##D 
## End(Not run)


