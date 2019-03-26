library(numbers)


### Name: cf2num
### Title: Generalized Continous Fractions
### Aliases: cf2num

### ** Examples

##  Examples from Wolfram Mathworld
print(cf2num(1:25), digits=16)  # 0.6977746579640077, eps()

a = 2*(1:25) + 1; b = 2*(1:25); a0 = 1  # 1/(sqrt(exp(1))-1)
cf2num(a, b, a0)                        # 1.541494082536798

a <- b <- 1:25                          # 1/(exp(1)-1)
cf2num(a, b)                            # 0.5819767068693286

a <- rep(1, 100); b <- 1:100; a0 <- 1   # 1.5251352761609812
cf2num(a, b, a0, finite = FALSE)        # 1.525135276161128
cf2num(a, b, a0, finite = TRUE)         # 1.525135259240266



