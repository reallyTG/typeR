library(modeest)


### Name: lientz
### Title: The empirical Lientz function and the Lientz mode estimator
### Aliases: lientz Lientz plot.lientz print.lientz mlv.lientz

### ** Examples

# Unimodal distribution
x <- rbeta(1000,23,4)

## True mode
betaMode(23, 4)

## Lientz object
f <- lientz(x, 0.2)
print(f)
plot(f)

## Estimate of the mode
mlv(f)              # optim(shorth(x), fn = f)
mlv(f, abc = TRUE)  # x[which.min(f(x))]
mlv(x, method = "lientz", bw = 0.2)

# Bimodal distribution
x <- c(rnorm(1000,5,1), rnorm(1500, 22, 3))
f <- lientz(x, 0.1)
plot(f)




