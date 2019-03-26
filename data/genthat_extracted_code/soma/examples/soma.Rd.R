library(soma)


### Name: soma
### Title: The Self-Organising Migrating Algorithm
### Aliases: soma plot.soma

### ** Examples

# Rastrigin's function, which contains many local minima
rastrigin <- function (a) 20 + a[1]^2 + a[2]^2 - 10*(cos(2*pi*a[1])+cos(2*pi*a[2]))

# Find the global minimum over the range -5 to 5 in each parameter
x <- soma(rastrigin, list(min=c(-5,-5),max=c(5,5)))

# Find the location of the leader - should be near the true minimum of c(0,0)
print(x$population[,x$leader])

# Plot the cost history of the leaders
plot(x)



