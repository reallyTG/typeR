library(snowboot)


### Name: plot.snowboot
### Title: Plot Degree Distribution Estimates
### Aliases: plot.snowboot

### ** Examples

net <- artificial_networks[[1]]
x <- lsmi_dd(net = net, n.wave = 2, n.seed = 40)
plot(x)

x2 <- boot_dd(x)
plot(x2, k = c(1:10))

x3 <- boot_ci(x2, prob = 0.99)
plot(x3, k = c(1:10))




