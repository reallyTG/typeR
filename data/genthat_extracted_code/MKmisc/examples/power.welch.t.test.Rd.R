library(MKmisc)


### Name: power.welch.t.test
### Title: Power calculations for two sample Welch t test
### Aliases: power.welch.t.test
### Keywords: htest

### ** Examples

 ## identical results as power.t.test, since sd = sd1 = sd2 = 1
 power.welch.t.test(n = 20, delta = 1)
 power.welch.t.test(power = .90, delta = 1)
 power.welch.t.test(power = .90, delta = 1, alternative = "one.sided")

 ## sd1 = 0.5, sd2 = 1
 power.welch.t.test(delta = 1, sd1 = 0.5, sd2 = 1, power = 0.9)

 ## No test: 
 ## empirical check
 M <- 10000
 ps <- numeric(M)
 for(i in seq_len(M)){
   x <- rnorm(15, mean = 0, sd = 0.5)
   y <- rnorm(15, mean = 1, sd = 1.0)
   ps[i] <- t.test(x, y)$p.value
 }
 ## empirical power
 sum(ps < 0.05)/M
 
## End(No test)



