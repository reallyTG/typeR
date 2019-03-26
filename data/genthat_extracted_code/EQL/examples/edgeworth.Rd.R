library(EQL)


### Name: edgeworth
### Title: Edgeworth Approximation
### Aliases: edgeworth

### ** Examples

# Approximation of the mean of n iid Chi-squared(2) variables

n <- 10
df <- 2
mu <- df
sigma2 <- 2*df
rho3 <- sqrt(8/df)
rho4 <- 12/df
x <- seq(max(df-3*sqrt(2*df/n),0), df+3*sqrt(2*df/n), length=1000)
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean")
plot(ea, lwd=2)

# Mean of n Chi-squared(2) variables is n*Chi-squared(n*2) distributed
lines(x, n*dchisq(n*x, df=n*mu), col=2)



