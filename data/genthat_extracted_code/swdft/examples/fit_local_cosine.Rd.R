library(swdft)


### Name: fit_local_cosine
### Title: Estimate parameters of a local cosine signal
### Aliases: fit_local_cosine

### ** Examples

# First generate a local periodic signal
N <- 15
window_size <- 2^3
A <- 1
Fr <- 4
f <- (Fr * window_size) / N
phase <- 1
S <- 10
L <- 10
x <- local_signal(N=N, A=A, Fr=Fr, phase=phase, S=S, L=L)

# Take the SWDFT and estimate parameters with fit_local_cosine
b <- swdft(x=x, n=window_size, normalize=(1/sqrt(window_size)))
bhat <- fit_local_cosine(b)




