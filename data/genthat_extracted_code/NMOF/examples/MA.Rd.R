library(NMOF)


### Name: MA
### Title: Simple Moving Average
### Aliases: MA

### ** Examples

MA(1:10, 3)
MA(1:10, 3, pad = NA)

y <- seq(1, 4, by = 0.3)
z <- MA(y, 1)
all(y == z)      ### (typically) FALSE
all.equal(y, z)  ### should be TRUE

## 'Relative strength index'
rsi <- function(y, t) {
    y <- diff(y)
    ups   <- y + abs(y)
    downs <- y - abs(y)
    RS <- -MA(ups, t) / MA(downs, t)
    RS/(1 + RS)
}
x <- cumprod(c(100, 1 + rnorm(100, sd = 0.01)))
par(mfrow = c(2,1))
plot(x, type = "l")
plot(rsi(x, 14), ylim = c(0,1), type = "l")



