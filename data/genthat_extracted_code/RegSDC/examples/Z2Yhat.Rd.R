library(RegSDC)


### Name: Z2Yhat
### Title: Suppressed tabular data: Yhat from X and Z
### Aliases: Z2Yhat

### ** Examples

# Same data as in the paper
z <- RegSDCdata("sec7z")
x <- RegSDCdata("sec7x")
Z2Yhat(z, x)

# With y known, yHat can be computed in other ways
y <- RegSDCdata("sec7y")  # Now z is t(x) %*% y 
fitted(lm(y ~ x - 1))
IpsoExtra(y, x, FALSE, resScale = 0)



