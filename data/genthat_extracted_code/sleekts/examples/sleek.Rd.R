library(sleekts)


### Name: sleek
### Title: Velleman PF (1980)- 4253H, twice smoothing
### Aliases: sleek

### ** Examples

##Example of sleek function using time series data tsdata
#(GDP per capita Bangladesh, currency gold in ounce) in sleekts package:
library(sleekts)
data(tsData)
tsData
sleek(tsData)
# To see original data plot and smoothed data plot
par(mfrow = c(2, 1))
plot(tsData); plot(sleek(tsData));

## The function is currently defined as
function (y) 
{
    h <- function(y) {
        N <- length(y)
        z <- NULL
        z[1] <- y[1]
        z[2] <- median(c(y[1], y[2]))
        z[3] <- median(c(y[2], y[3]))
        for (i in 4:(N)) {
            z[i] <- median(c(y[i - 3], y[i - 2], y[i - 1], y[i]))
        }
        z[N - 1] <- median(c(y[N - 2], y[N - 1]))
        z[N] <- median(c(y[N - 1], y[N]))
        z[N + 1] <- y[N]
        z1 <- NULL
        for (i in 1:N) {
            z1[i] <- (z[i] + z[i + 1])/2
        }
        z2 <- NULL
        z2[1] <- z1[1]
        z2[2] <- median(c(z1[1], z1[2], z1[3]))
        for (i in 3:(N - 2)) {
            z2[i] <- median(c(z1[i - 2], z1[i - 1], z1[i], z1[i + 
                1], z1[i + 2]))
        }
        z2[N - 1] <- median(c(z1[N - 2], z1[N - 1], z1[N]))
        z2[N] <- z1[N]
        z3 <- NULL
        z3[1] <- z2[1]
        for (i in 2:(N - 1)) {
            z3[i] <- median(c(z2[i - 1], z2[i], z2[i + 1]))
        }
        z3[N] <- z2[N]
        z4 <- NULL
        z4[1] <- z3[1]
        for (i in 2:(N - 1)) {
            z4[i] <- (z3[i - 1] + z3[i] + z3[i + 1])/4
        }
        z4[N] <- z3[N]
        z4[1] <- median(c(z4[1], z4[2], (3 * z4[2] - 2 * z4[3])))
        z4[N] <- median(c(z4[N], z4[N - 1], (3 * z4[N - 2] - 
            2 * z4[N - 1])))
        return(z4)
    }
    sm <- h(y)
    rf <- (y - sm)
    sm.rf <- h(rf)
    smooth <- (sm.rf + sm)
    if (is.ts(y) == 1) {
        date <- start(y)
        smooth <- ts(smooth, start = date)
    }
    return(smooth)
  }



