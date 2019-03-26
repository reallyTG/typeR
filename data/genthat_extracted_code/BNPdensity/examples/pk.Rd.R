library(BNPdensity)


### Name: pk
### Title: Kernel distribution function
### Aliases: pk
### Keywords: internal

### ** Examples

## The function is currently defined as
function (q, distr = NULL, mu = NULL, sigma = NULL) 
{
    if (is.null(distr)) {
        stop(msg)
    }
    else if (distr == 1) {
        a <- ifelse(is.null(mu), 0, mu)
        b <- ifelse(is.null(sigma), 1, sigma)
        pk <- pnorm(q, mean = a, sd = b)
    }
    else if (distr == 2) {
        a <- ifelse(is.null(mu), 1, mu^2/sigma^2)
        b <- ifelse(is.null(sigma), 1, mu/sigma^2)
        pk <- pgamma(q, shape = a, rate = b)
    }
    else if (distr == 3) {
        a <- ifelse(is.null(mu), 0.5, (1 - mu) * (mu/sigma)^2 - 
            mu)
        b <- ifelse(is.null(sigma), 1/sqrt(12), (mu * (1 - mu)/sigma^2 - 
            1) * (1 - mu))
        if (any(c(a, b) <= 0)) 
            stop(paste("\nNegative Beta parameters:\n a =", a, 
                ";\t b =", b))
        pk <- pbeta(q, shape1 = a, shape2 = b)
    }
    else if (distr == 4) {
        a <- ifelse(is.null(mu), 0, mu)
        b <- ifelse(is.null(sigma), 1/sqrt(2), sigma/sqrt(2))
        pk <- ifelse(q < a, exp((q - a)/b)/2, 1 - exp((a - q)/b)/2)
    }
    else if (distr == 5) {
        a <- ifelse(is.null(mu), exp(1/2), log(mu/sqrt(1 + (sigma/mu)^2)))
        b <- ifelse(is.null(sigma), exp(1) * (exp(1) - 1), sqrt(log(1 + 
            (sigma/y)^2)))
        pk <- plnorm(q, meanlog = a, sdlog = b)
    }
    else if (distr == 6) {
        pk <- phalfcauchy(q, location = ifelse(is.null(mu), 0, 
            mu), scale = ifelse(is.null(sigma), 1, sigma))
    }
    else if (distr == 7) {
        pk <- phalfnorm(q, mean = ifelse(is.null(mu), 0, mu), 
            sd = ifelse(is.null(sigma), 1, sigma))
    }
    else if (distr == 8) {
        pk <- phalft(q, df = 10, mean = ifelse(is.null(mu), 0, 
            mu), sd = ifelse(is.null(sigma), 1, sigma))
    }
    else if (distr == 9) {
        pk <- punif(q, min = ifelse(is.null(mu), 0, mu), max = ifelse(is.null(sigma), 
            1, sigma))
    }
    else if (distr == 10) {
        pk <- ptnorm(q, mean = ifelse(is.null(mu), 0, mu), sd = ifelse(is.null(sigma), 
            1, sigma), lower = 0.1)
    }
    else {
        stop(msg)
    }
    return(pk)
  }



