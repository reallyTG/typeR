library(Momocs)


### Name: harm_pow
### Title: Calculates harmonic power given a list from e/t/rfourier
### Aliases: harm_pow

### ** Examples


ef <- efourier(bot[1], 24)
rf <- efourier(bot[1], 24)
harm_pow(ef)
harm_pow(rf)

plot(cumsum(harm_pow(ef)[-1]), type='o',
  main='Cumulated harmonic power without the first harmonic',
  ylab='Cumulated harmonic power', xlab='Harmonic rank')




