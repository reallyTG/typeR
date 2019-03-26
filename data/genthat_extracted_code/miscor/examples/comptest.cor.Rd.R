library(miscor)


### Name: comptest.cor
### Title: Comparision of product-moment correlation coefficients
### Aliases: comptest.cor

### ** Examples

# Dependent samples: Generate random data
x <- c(3, 2, 2, 3, 7, 8, 5, 9)
y <- c(2, 4, 1, 5, 7, 3, 6, 7)
z <- c(1, 4, 3, 3, 1, 4, 2, 5)

#--------------------------------------
# Dependent samples
# H0: rho.xy == rho.xz,  H1: rho.xy != rho.xz

comptest.cor(x, y, z)

#--------------------------------------
# Dependent samples
# H0: rho.xy <= rho.xz,  H1: rho.xy > rho.xz
# r.xy = 0.44, r.xz = 0.21. r.yz = 0.20, n = 120

comptest.cor(r.xy = 0.44, r.xz = 0.21, r.yz = 0.20, n = 120,
             alternative = "greater")

###

# Independent samples: Generate random data
dat <- data.frame(group = rep(1:2, each = 200),
                  rbind(sim.cor(200, rho = 0.3),
                        sim.cor(200, rho = 0.5)))

#--------------------------------------
# Independent samples
# H0: rho.1 == rho.2, H1: rho.1 != rho.2

comptest.cor(x = dat$x, y = dat$y, group = dat$group)

#--------------------------------------
# Independent samples
# H0: rho.1 >= rho.2, H1: rho.1 ! < rho.2
# Group 1: r = 0.32, n = 108
# Group 2: r = 0.56, n = 113

comptest.cor(r.1 = 0.32, n.1 = 108, r.2 = 0.56, n.2 = 113,
             alternative = "less")



