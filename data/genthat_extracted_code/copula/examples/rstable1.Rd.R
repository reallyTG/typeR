library(copula)


### Name: rstable1
### Title: Random numbers from (Skew) Stable Distributions
### Aliases: rstable1 rstable
### Keywords: distribution

### ** Examples

   # Generate and plot a series of stable random variates
   set.seed(1953)
   r <- rstable1(n = 1000, alpha = 1.9, beta = 0.3)
   plot(r, type = "l", main = "stable: alpha=1.9 beta=0.3",
        col = "steelblue"); grid()

   hist(r, "Scott", prob = TRUE, ylim = c(0,0.3),
        main = "Stable S(1.9, 0.3; 1)")
   lines(density(r), col="red2", lwd = 2)



