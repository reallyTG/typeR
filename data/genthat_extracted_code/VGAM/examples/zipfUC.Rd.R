library(VGAM)


### Name: Zipf
### Title: The Zipf Distribution
### Aliases: Zipf dzipf pzipf qzipf rzipf
### Keywords: distribution

### ** Examples

N <- 10; shape <- 0.5; y <- 1:N
proby <- dzipf(y, N = N, shape = shape)
## Not run: 
##D  plot(proby ~ y, type = "h", col = "blue", ylab = "Probability",
##D      ylim = c(0, 0.2), main = paste("Zipf(N = ",N,", shape = ",shape,")", sep = ""),
##D      lwd = 2, las = 1) 
## End(Not run)
sum(proby)  # Should be 1
max(abs(cumsum(proby) - pzipf(y, N = N, shape = shape)))  # Should be 0



