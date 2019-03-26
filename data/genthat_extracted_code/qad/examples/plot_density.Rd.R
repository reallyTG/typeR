library(qad)


### Name: plot_density
### Title: Plot density of empirical checkerboard copula
### Aliases: plot_density

### ** Examples

n <- 1000
x <- runif(n,0,1)
y <- runif(n,0,1)
sample <- data.frame(x,y)
plot(sample)

mass <- emp_c_copula(sample, resolution=8)
plot_density(mass, density=TRUE)
plot_density(mass, density=FALSE)



