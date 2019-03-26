library(SAPP)


### Name: eptren
### Title: Maximum Likelihood Estimates of Intensity Rates
### Aliases: eptren
### Keywords: spatial

### ** Examples

## The Occurrence Times Data of 627 Blastings
data(Brastings)
eptren(Brastings,,, 10, 1000)      # exponential polynomial trend fitting

eptren(Brastings,,, 10, 1000, 1)   # exponential Fourier series fitting

## Poisson Process data
data(PoissonData)
eptren(PoissonData,,, 10, 1000)      # exponential polynomial trend fitting

eptren(PoissonData,,, 10, 1000, 1)   # exponential Fourier series fitting

## The aftershock data of 26th July 2003 earthquake of M6.2
data(main2003JUL26)
x <- main2003JUL26
eptren(x$time, x$magnitude,, 10, 1000)      # exponential polynomial trend fitting

eptren(x$time, x$magnitude,, 10, 1000, 1)   # exponential Fourier series fitting



