library(seqtest)


### Name: print.size
### Title: Print size object
### Aliases: print.size

### ** Examples


#--------------------------------------
# Two-sided one-sample test
# theta = 0.5
# alpha = 0.05, beta = 0.2

n <- size.mean(theta = 0.5, sample = "one.sample",
               alternative = "two.sided", alpha = 0.05, beta = 0.2)

print(n)

#--------------------------------------
# Two-sided one-sample test
# H0: pi = 0.5, H1: pi != 0.5
# alpha = 0.05, beta = 0.2, delta = 0.2

n <- size.prop(delta = 0.2, pi = 0.5, sample = "one.sample",
               alternative = "two.sided", alpha = 0.05, beta = 0.2)

print(n)

#--------------------------------------
# H0: rho = 0.3, H1: rho != 0.3
# alpha = 0.05, beta = 0.2, delta = 0.2

n <- size.cor(delta = 0.2, rho = 0.3, alpha = 0.05, beta = 0.2)

print(n)



