library(bulletcp)


### Name: imputeGP
### Title: Impute missing data.
### Aliases: imputeGP

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
fake_groove <- fake_groove[sample.int(n = nrow(fake_groove),
    size = round(0.8 * nrow(fake_groove)),
    replace = FALSE),]
fake_groove <- fake_groove[order(fake_groove$x),]
plot(fake_groove$x, fake_groove$y)

# add NA values where the data are missing
x_na <- seq(from = min(fake_groove$x), to = max(fake_groove$x),
 by = min(fake_groove$x[2:nrow(fake_groove)] - fake_groove$x[1:(nrow(fake_groove) - 1)]))
x_na <- x_na[!round(x_na, digits = 2) %in% round(fake_groove$x, digits = 2)]
y_na <- rep(NA, times = length(x_na))
d_na <- data.frame("x" = x_na, "y" = y_na)
fake_groove <- rbind(fake_groove, d_na)
fake_groove <- fake_groove[order(fake_groove$x),]

## impute the data
full_data <- imputeGP(y = fake_groove$y, x = fake_groove$x, sigma = 0.9, l = 15)
head(full_data)
plot(full_data$x, full_data$y)



