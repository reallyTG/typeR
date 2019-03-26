library(mewAvg)


### Name: mewMean
### Title: Update the moving expanding window average
### Aliases: mewMean

### ** Examples

n_iter <- 100

i_to_print <- 10

results <- matrix(data = double(2*n_iter/i_to_print),
                  nrow = n_iter/i_to_print,
                  ncol = 2)

av <- mewInit(n_bin = 4, n_xx = 2, ff = 0.5)

for (i in 1:n_iter) {

  value <- runif(n=2)
  value[1] <- ((cos(value[1]*2*pi))^2)*(1 - exp(-0.01*i))
  value[2] <- (-((sin(value[2]*2*pi))^2))*(1 - exp(-0.01*i))

  av <- mewAccum(xx = value, av = av)

  if (i%%i_to_print == 0) {

    av <- mewMean(av)
    show(av)
    results[i/i_to_print, ] <- mewGetMean(av)
  }
}

## plot the results

plot(c(1, (n_iter/i_to_print)),
     c(min(results), max(results)),
     type = "n")
points(1:(n_iter/i_to_print), results[, 1])
points(1:(n_iter/i_to_print), results[, 2])

## Now, a larger example, and we pause part way through to assess
## convergence

n_iter <- 1000
av <- mewInit(n_bin = 4, n_xx = 5000, ff = 0.5)
for (i in 1:n_iter) {

  new_samp <- runif(n = 5000)
  av <- mewAccum(xx = new_samp, av = av)
}

av <- mewMean(av = av)

## of course each element of the mean sould converge to 0.5.  After
## 1000 iterations, the first six elements of the mean vector are
show(av)

## run another 1000 iterations
for (i in 1:1000) {

  new_samp <- runif(n = 5000)
  av <- mewAccum(xx = new_samp, av = av)
}

av <- mewMean(av)

## check the mean of the first six elements again
show(av)



