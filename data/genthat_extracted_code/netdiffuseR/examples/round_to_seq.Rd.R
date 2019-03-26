library(netdiffuseR)


### Name: round_to_seq
### Title: Takes a numeric vector and maps it into a finite length sequence
### Aliases: round_to_seq

### ** Examples


x <- rnorm(100)
w <- data.frame(as.integer(round_to_seq(x, as_factor = TRUE)),x)
plot(w,x)




