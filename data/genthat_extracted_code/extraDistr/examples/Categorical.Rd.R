library(extraDistr)


### Name: Categorical
### Title: Categorical distribution
### Aliases: Categorical dcat pcat qcat rcat rcatlp
### Keywords: distribution

### ** Examples


# Generating 10 random draws from categorical distribution
# with k=3 categories occuring with equal probabilities
# parametrized using a vector

rcat(10, c(1/3, 1/3, 1/3))

# or with k=5 categories parametrized using a matrix of probabilities
# (generated from Dirichlet distribution)

p <- rdirichlet(10, c(1, 1, 1, 1, 1))
rcat(10, p)

x <- rcat(1e5, c(0.2, 0.4, 0.3, 0.1))
plot(prop.table(table(x)), type = "h")
lines(0:5, dcat(0:5, c(0.2, 0.4, 0.3, 0.1)), col = "red")

p <- rdirichlet(1, rep(1, 20))
x <- rcat(1e5, matrix(rep(p, 2), nrow = 2, byrow = TRUE))
xx <- 0:21
plot(prop.table(table(x)))
lines(xx, dcat(xx, p), col = "red")

xx <- seq(0, 21, by = 0.01)
plot(ecdf(x))
lines(xx, pcat(xx, p), col = "red", lwd = 2)

pp <- seq(0, 1, by = 0.001)
plot(ecdf(x))
lines(qcat(pp, p), pp, col = "red", lwd = 2)




