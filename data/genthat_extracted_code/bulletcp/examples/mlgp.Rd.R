library(bulletcp)


### Name: mlgp
### Title: Impute missing data.
### Aliases: mlgp

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
plot(fake_groove$x, fake_groove$y)


# estimate the MLE's
mles <- mlgp(y = fake_groove$y, x = fake_groove$x)



