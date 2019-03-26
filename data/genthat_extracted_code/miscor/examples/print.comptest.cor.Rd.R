library(miscor)


### Name: print.comptest.cor
### Title: Print comptest.cor
### Aliases: print.comptest.cor

### ** Examples

#--------------------------------------
# Dependent samples

# Generate random data
x <- c(3, 2, 2, 3, 7, 8, 5, 9)
y <- c(2, 4, 1, 5, 7, 3, 6, 7)
z <- c(1, 4, 3, 3, 1, 4, 2, 5)

#............................................
# H0: rho.xy == rho.xz,  H1: rho.xy != rho.xz

obj <- comptest.cor(x, y, z, output = FALSE)
print(obj)

#...........................................
# H0: rho.xy <= rho.xz,  H1: rho.xy > rho.xz
# r.xy = 0.44, r.xz = 0.21. r.yz = 0.20, n = 120

obj <- comptest.cor(r.xy = 0.44, r.xz = 0.21, r.yz = 0.20, n = 120,
                    alternative = "greater", output = FALSE)
print(obj)

#--------------------------------------
# Independent samples

# Generate random data
dat <- data.frame(group = rep(1:2, each = 200),
                  rbind(sim.cor(200, rho = 0.3),
                        sim.cor(200, rho = 0.5)))

#.......................................
# H0: rho.1 == rho.2, H1: rho.1 != rho.2

obj <- comptest.cor(x = dat$x, y = dat$y, group = dat$group,
                    output = FALSE)
print(obj)

#........................................
# H0: rho.1 >= rho.2, H1: rho.1 ! < rho.2
# Group 1: r = 0.32, n = 108
# Group 2: r = 0.56, n = 113

obj <- comptest.cor(r.1 = 0.32, n.1 = 108, r.2 = 0.56, n.2 = 113,
                    alternative = "less", output = FALSE)
print(obj)



